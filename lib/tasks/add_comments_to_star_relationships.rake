# encoding: utf-8
require 'rubygems'
require 'rake'
require 'execjs'
require 'csv'

namespace :repair do
  desc "Add hour and year to people"
  task :star_relationship_comments => :environment do
    StarRelationship.find_each(:batch_size => 100) do |star_relationship|
      star_relationship.comments.create(comments: '') if star_relationship.comments.empty?
    end
  end
end
