# encoding: utf-8
require 'rubygems'
require 'rake'
require 'execjs'
require 'csv'

namespace :astro do
  desc "Add hour and year to people"
  task :date_json => :environment do
    File.open(Rails.root.join(*%w(app assets javascripts cal_convert.js.coffee)), 'a') {|file|

      file.write("\n  @date_table = [\n")
      dates = []
      i = 0
      CSV.foreach(Rails.root.join('lib', 'tasks', 'dates.csv')) do |row|
        i += 1
        date = Date.new(row[0].to_i, row[1].to_i, row[2].to_i)
        the_js = "Date.parse(\"#{date.strftime("%Y-%m-%d")}T00:00:00.000Z\")"
        # puts the_js
        # puts ExecJS.eval(the_js)
        the_num = ExecJS.eval(the_js).to_s.match(/^\-?\d+/)[0].to_i
        3.times{row.shift}
        lunar = row.map{|t| 
          if t.to_i > 0
            t.to_i
          else
            (t == "True")
          end
        }
        dates << ([the_num] + lunar)
        if (i % 10) == 0
          file.write "    " + dates.to_json.gsub(/\[\[/, '[').gsub(/\]\]/, ']') + "\n"
          dates = []
        end
      end

      file.write "    " + dates.to_json.gsub(/\[\[/, '[').gsub(/\]\]/, ']') + "\n  ]\n"
    }
  end
end
