begin
  require "rspec/core/rake_task"
  
  PLUGIN = "vendor/plugins/facho"
  
  namespace :spec do
    desc "Run the Facho spec tests"  
    RSpec::Core::RakeTask.new(:facho) do |spec|
      spec.pattern = "#{PLUGIN}/spec/**/*_spec.rb"
    end
  end
rescue LoadError
end
