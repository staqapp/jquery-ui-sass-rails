require "bundler/gem_tasks"

desc "Convert jQuery UI CSS to SASS"
task :convert do
  require "jquery/ui/sass/rails/converter"

  css_path = "jquery-ui-rails/app/assets/stylesheets"
  sass_path = "app/assets/stylesheets"

  Jquery::Ui::Sass::Rails::Converter(css_path,sass_path) do |err_msg|
    abort err_msg
  end

  puts "Successfully converted!"
end
