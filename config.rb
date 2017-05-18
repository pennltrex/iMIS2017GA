# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "Assets/css"
sass_dir = "Assets/sass"
images_dir = "Assets/images"
javascripts_dir = "AsiCommon/Scripts"

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# This line hides the comments that display the Sass file lines in comments.
# Comment out if line comments are wanted.
line_comments = false

# Enabling sourcemaps allows for easier Sass debugging in Chrome
# See https://developers.google.com/chrome-developer-tools/docs/css-preprocessors
# If sourcemaps are needed, comment this line back in
# sourcemap = true

# increase the decimal precision to 10 decimal places
Sass::Script::Number.precision = 10

# The following code moves the theme CSS files to their respective folders
# See http://css-tricks.com/compass-compiling-and-wordpress-themes/
# Theme CSS files must be named 99-[ThemeName].css for this to work properly
require 'fileutils'
on_stylesheet_saved do |file|
  if File.exists?(file) && File.basename(file).start_with?("99-")
    puts "Moving: #{file}"
    FileUtils.mv(file, File.dirname(file) + "/../../App_Themes/" + File.basename(file)[3..-5] + "/" + File.basename(file))
  end
end