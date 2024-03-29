namespace :db do
  namespace :migrate do
    description = "Migrate the database through scripts in vendor/plugins/facho/db/migrate"
    description << "and update db/schema.rb by invoking db:schema:dump."
    description << "Target specific version with VERSION=x. Turn off output with VERBOSE=false."
    desc description
    task :facho => :environment do
      ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
      ActiveRecord::Migrator.migrate(File.join(File.dirname(__FILE__),"..","..","db/migrate/"), ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
      Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end
  end

  namespace :rollback do
    description = "Rollback the database through scripts in vendor/plugins/facho/db/migrate"
    description << "and update db/schema.rb by invoking db:schema:dump."
    desc description
    task :facho => :environment do
      ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
      ActiveRecord::Migrator.rollback(File.join(File.dirname(__FILE__),"..","..","db/migrate/"))
      Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end
  end

  namespace :seed do
    description = "Add Facho seed data to the database"
    desc description
    task :facho => :environment do
      require File.join(File.dirname(__FILE__),'..','..','db','seeds.rb')
    end
  end
end
