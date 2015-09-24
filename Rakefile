require 'travis'
require 'bundler/setup'
require 'rspec/core/rake_task'

task :default => :spec

RSpec::Core::RakeTask.new('spec')

task :travis do
    Travis.github_auth(ENV['GITHUB_TOKEN'])
    build = Travis::Repository.find(ENV['TRAVIS_BUILD'])
    build.last_build.restart
end
