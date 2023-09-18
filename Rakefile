# frozen_string_literal: true

require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/*_test.rb"]
  t.options = "--verbose=normal" unless ENV.key?("TESTOPTS")
end

task default: :test
