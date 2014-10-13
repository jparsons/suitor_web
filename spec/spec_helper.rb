# spec/spec_helper.rb
require 'rack/test'

require File.expand_path '../../suitor_web.rb', __FILE__

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() SuitorWeb end
end

RSpec.configure { |c| c.include RSpecMixin }
