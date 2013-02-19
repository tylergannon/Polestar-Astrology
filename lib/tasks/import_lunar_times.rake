# encoding: utf-8
require 'rubygems'
require 'rake'

namespace :import do
  desc "Add hour and year to people"
  task :lunar_times => :environment do
    Person.all.each do |person|
      puts person.full_name
      person.save
    end
  end
end
