# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exist?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

require 'rake'
::Rake.application.init
::Rake.application.load_rakefile

# Run `bundle install` whenever Gemfile changes.
guard :bundler do
  watch('Gemfile')
end

guard :yarn do
  watch('package.json')
end

guard :process, name: "Webpack Dev Server", command: "bin/webpack-dev-server", env: {"RAILS_ENV" => "development"} do
  watch('config/webpacker.yml')
end

# Restart the dev server whenever configs change. (The dev server will automatically reload app code.)
guard :rails, port: (ENV['RAILS_PORT'] || 8000), host: '0.0.0.0', server: :puma do
  watch('Gemfile.lock')
end