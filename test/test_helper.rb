ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "mocha/mini_test"
require "minitest/spec"
require "minitest-spec-context"
require 'minitest/autorun'
#require "minitest/reporters"
require 'database_cleaner'
require "minitest/rg"


# Minitest::Reporters.use!(
#   Minitest::Reporters::ProgressReporter.new,
#   ENV,
#   Minitest.backtrace_filter)

# Capybara and poltergeist integration
require "capybara/rails"
require "capybara/poltergeist"
Capybara.javascript_driver = :poltergeist
DatabaseCleaner.strategy = :truncation
# DatabaseCleaner.clean

class ActiveSupport::TestCase
 # self.use_transactional_tests = false
 # self.use_instantiated_fixtures  = false
 fixtures :all
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

class Minitest::Spec
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
# class Minitest::Spec
#   around do |tests|
#     DatabaseCleaner.cleaning(&tests)
#   end
# end
# See: https://gist.github.com/mperham/3049152
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || ConnectionPool::Wrapper.new(:size => 1) { retrieve_connection }
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
