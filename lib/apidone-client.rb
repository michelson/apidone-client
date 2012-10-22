require 'pathname'
require "apidone-client/version"
require 'faraday'
require 'json'

module Apidone
  module Client
    
    ROOT_PATH = Pathname(__FILE__).dirname.expand_path

    autoload  :CLI,           'apidone-client/cli.rb'
    autoload  :Connection,    'apidone-client/connection.rb'
    autoload  :Resource,      'apidone-client/resource.rb'
  end
end
