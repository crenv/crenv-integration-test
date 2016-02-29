require_relative './spec_helper'

describe 'install' do
  FileUtils.rm_rf './home/'
  system 'git clone https://github.com/pine613/crenv.git ./home/crenv'
  system 'git clone https://github.com/pine613/crystal-build.git ./home/crenv/plugins/crystal-build'

  versions = YAML.load_file('./config/versions.yml')
  versions.each do |version|
    it 'crenv install v' + version do
      Bundler.with_clean_env do
        ENV['PATH'] = './home/crenv/bin:' + ENV['PATH']
        ENV['CRENV_ROOT'] = './home/crenv/'

        # install
        system 'crenv install ' + version
        expect($?).to eq(0)

        # versions
        expect(`crenv versions`).to include(version)

        # local
        system 'crenv global ' + version
        expect($?).to eq(0)
      end
    end
  end
end
