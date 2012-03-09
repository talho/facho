begin
  require 'cucumber/rake/task'

  ENV["RAILS_ENV"] ||= "cucumber"

  namespace :cucumber do
    desc = "Facho plugin, add any cmd args after --"
    Cucumber::Rake::Task.new({:facho => 'db:test:prepare'}, desc) do |t|
      t.cucumber_opts = "-r features " +
                        "-r vendor/plugins/facho/spec/factories.rb " +
                        "-r vendor/plugins/facho/features/step_definitions " +
                        " #{ARGV[1..-1].join(" ") if ARGV[1..-1]}" +
                        # add all Facho features if none are passed in
                        (ARGV.grep(/^vendor/).empty? ? "vendor/plugins/facho/features" : "")
      t.fork = true
      t.profile = 'default'
    end
  end
rescue LoadError
  # to catch if cucmber is not installed, as in production
end
