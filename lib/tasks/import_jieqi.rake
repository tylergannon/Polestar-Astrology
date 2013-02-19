# encoding: utf-8
require File.join(File.dirname(__FILE__), 'jieqi_data.rb')

namespace :import do
  task :lunar_times => :environment do
    Person.all.each do |person|
      puts person.name
      person.save
    end
  end
end
