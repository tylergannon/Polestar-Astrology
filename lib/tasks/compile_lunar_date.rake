# encoding: utf-8
require 'rubygems'
require 'rake'

namespace :compile do
  desc "Add hour and year to people"
  task :lunar_date_js => :environment do
    
    source = File.read("app/assets/javascripts/lunar_date.js")
    compiled = Uglifier.compile(source, toplevel: true, except: ['LunarDate', 'toJSON'])
    File.open("app/assets/javascripts/lunar_date.min.js", 'w'){|f| f.write(compiled)}
  end
end
