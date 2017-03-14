$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
require 'coveralls'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter '/test/'
  minimum_coverage(95)
end

require 'gitodo'
require 'byebug'
require 'minitest/autorun'
require 'minitest/mock'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

def cd_sample(&block)
  cd_to "test/sample", &block
end

def cd_sample_a(&block)
  cd_to 'test/sample/a', &block
end

def cd_to(path)
  previous_path = Dir.pwd
  Dir.chdir path

  yield
ensure
  Dir.chdir previous_path
end
