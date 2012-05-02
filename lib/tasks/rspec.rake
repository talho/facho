begin
  require "rspec/core/rake_task"
  
  plugin = "vendor/plugins/facho"
  
  namespace :spec do
    desc "Run the Facho spec tests"  
    RSpec::Core::RakeTask.new(:facho) do |spec|
      spec.pattern = "#{plugin}/spec/**/*_spec.rb"
    end
  end
rescue LoadError
end
