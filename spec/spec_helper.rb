$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib', 'apidone-client'))
require 'rspec'
require 'apidone-client'
require 'faraday'
require "json"