# frozen_string_literal: true

require 'rake/testtask'
require 'rubocop/rake_task'

task default: 'test'

Rake::TestTask.new do |task|
  task.pattern = 'test/*_test.rb'
end

RuboCop::RakeTask.new(:rubocop) do |task|
  task.options = ['--display-cop-names']
end
