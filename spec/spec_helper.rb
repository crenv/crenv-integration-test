require 'rspec'
require 'yaml'

Dir['./support/**/*.rb'].each do |f|
    require f
end

RSpec.configure do |config|
  config.color = true
  config.tty = $stdout.tty?
  config.formatter = :documentation
end
