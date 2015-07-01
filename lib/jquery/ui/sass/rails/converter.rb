module Jquery
  module Ui
    module Sass
      module Rails
        module_function

        def Converter(css_path,sass_path)
          current_sass_files = Dir["#{sass_path}/*"]
          css_files = Dir["#{css_path}/**/*.{css,erb}"]

          if css_files.empty?
            yield "Unable to find CSS files."
            return
          end

          FileUtils.rm_rf(current_sass_files,secure: true)

          css_files.each do |css_file|
            basename = File.basename(css_file)
            subdirectory = File.dirname(css_file).gsub(/^#{css_path}/,"")
            css = IO.read(css_file)

            if basename =~ /.erb$/
              basename.gsub!(/.erb$/,"") # drop erb file extension

              # Remove block of depend_on_asset statements
              css.scan(/\/\*.*?\*\//m).each do |block|
                css.gsub!(block,"") if block =~ /\*= depend_on_asset/
              end

              # Convert all Sprocket image helpers to SASS
              css.gsub!(/<%=\s+image_path\((\S+)\)\s+%>/,"image-path(\\1)")
              css.gsub!(/<%=\s+image_url\((\S+)\)\s+%>/,"image-url(\\1)")
            end

            # Convert simple Sprocket require statements to @import
            #
            # //= require jquery-ui/all
            #
            # ~>
            #
            # @import "jquery-ui/all.css.scss";
            #
            css.gsub!(/^\/\/= require\s+(\S+)/,"@import '\\1.css.scss';");

            # Convert block of Sprocket require statements to import
            #
            #/*
            # *= require jquery-ui/core
            # *= require jquery-ui/theme
            # */
            #
            # ~>  !must handle blank lines until
            #
            # @import "jquery-ui/core.css.scss"
            # @import "jquery-ui/theme.css.scss"
            #
            css.scan(/\/\*.*?\*\//m).each do |block|
              next unless block =~ /\*= require/

              converted_block_lines = block.split(/\r?\n/).map do |line|

                # Strip begin and end of comment block
                line.gsub!(/^\s*(\/\*|\*\/)/,"");

                # Convert Sprocket require to SASS import
                line.gsub!(/^\s+\*= require\s+(\S+)/,"@import '\\1.css.scss';")

                line
              end

              # Join converted line and replace current block with converted block
              css.gsub!(block,converted_block_lines.join("\n"))
            end

            destination_directory = File.join(sass_path,subdirectory)
            destination_file = File.join(destination_directory,basename + ".scss")

            FileUtils.mkdir_p(destination_directory) # make destination directory

            File.open(destination_file,"w") do |file|
              file.puts css
            end
          end
        end
      end
    end
  end
end
