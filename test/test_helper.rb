require 'rubygems'
# require 'spork'
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

Spork.prefork do
  #  Load the sqlite3 testing database from the schema file.
  load(Rails.root.join *%w(db schema.rb))
  Devise.setup do |config|
    config.stretches = 1
  end
  
  Rails.logger.level = 4
  
  class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!
    include FactoryGirl::Syntax::Methods
  end
  
  class ActionController::TestCase
    include Devise::TestHelpers
    
    def self.sign_in_member
      setup do
        @member = FactoryGirl.create(:member)
        sign_in @member
      end
    end
  end
  
  class ActiveRecord::Base
    mattr_accessor :shared_connection
    @@shared_connection = nil

    def self.connection
      @@shared_connection || retrieve_connection
    end
  end
  
  # Forces all threads to share the same connection. This works on
  # Capybara because it starts the web server in a thread.
  ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
end

Spork.each_run do
  FactoryGirl.reload
  DatabaseCleaner.clean
  # Stem.reseed
  # Branch.reseed
  # Pillar.reseed
end
