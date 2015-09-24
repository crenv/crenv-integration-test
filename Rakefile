require 'bundler/setup'
require 'rspec/core/rake_task'

task :default => :spec

RSpec::Core::RakeTask.new('spec')

task :travis do
    require 'travis'
    Travis.access_token = ENV['TRAVIS_TOKEN']
    build = Travis::Repository.find(ENV['TRAVIS_BUILD'])
    build.last_build.restart
end
