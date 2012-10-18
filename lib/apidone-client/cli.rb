require "thor/group"

module Apidone
  module Client
    
    class Connection < Thor
      include Utils
      include Thor::Actions
      
      
      ### TODO: When these commands list grows big, we need to move them into a seperate commands.rb file
      map %w(--version -v) => 'info'
      desc "info", "information about ApiDone::Client."
      def info
        say "Version #{::Apidone::Client::VERSION}"
      end
      
      map %w(--create -c) => 'create'
      desc "create", "creates ApiDone reosurce"
      def create
      end
      
      map %w(--update -u) => 'update'
      desc "update", "updates ApiDone reosurce"
      def update
      end
      
      map %w(--destroy -d) => 'delete'
      desc "delete", "delete ApiDone reosurce"
      def delete
      end
      
      map %w(--list -l) => 'list'
      desc "list", "list ApiDone reosurce"
      def list
      end
      
    end
  end
end