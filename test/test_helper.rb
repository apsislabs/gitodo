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

def cd_sample
  Dir.chdir 'test/sample'

  yield

  Dir.chdir '../..'
end
