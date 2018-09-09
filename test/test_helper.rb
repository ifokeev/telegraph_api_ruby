ENV['APP_ENV'] = 'test'
ENV['RACK_ENV'] = 'test'

require 'minitest/reporters'
Minitest::Reporters.use!

require 'minitest/autorun'
