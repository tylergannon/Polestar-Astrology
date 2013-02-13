require 'rubygems'
require 'rake'

namespace :test do
  desc "Test lib modules"
  Rake::TestTask.new(:lib) do |t|    
    t.libs << "test"
    t.pattern = 'test/lib/**/*_test.rb'
    t.verbose = true    
  end
end

class Rake::Task
  def overwrite(&block)
    @actions.clear
    enhance(&block)
  end
end

Rake::Task["test:run"].overwrite do
  errors = %w(test:units test:functionals test:integration test:lib).collect do |task|
    begin
      Rake::Task[task].invoke
      nil
    rescue => e
      { :task => task, :exception => e }
    end
  end.compact

  if errors.any?
    puts errors.map { |e| "Errors running #{e[:task]}! #{e[:exception].inspect}" }.join("\n")
    abort
  end
end
