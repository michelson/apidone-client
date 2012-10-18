require "thor/group"

module Apidone
  module Client
    
    class CLI < Thor
      include Thor::Actions
      
      no_tasks{
        
        def connection(domain)
          @c = Apidone::Client::Connection.new(domain)
        end
        
      }
      
      ### TODO: When these commands list grows big, we need to move them into a seperate commands.rb file
      map %w(--version -v) => 'info'
      desc "info", "information about ApiDone::Client."
      def info
        say "Version #{::Apidone::Client::VERSION}"
      end
      
      map %w(--create -c) => 'create'
      desc "create", "Creates ApiDone resource"
      def create(domain, resource, data={} )
        connection(domain)
        @c.create(resource, data)
      end
      
      map %w(--update -u) => 'update'
      desc "update", "Updates ApiDone resource"
      def update(domain, resource, data={})
        connection(domain)
        @c.update(resource, data)
      end
      
      map %w(--destroy -d) => 'delete'
      desc "delete", "Delete ApiDone resource"
      def delete(domain, resource, id)
        connection(domain)
        @c.update(resource, id)
      end
      
      map %w(--list -l) => 'list'
      desc "list", "List ApiDone resource"
      def list(domain, resource)
        connection(domain)
        @c.list(resource)
      end
      
      map %w(--show -s) => 'show'
      desc "show", "Show ApiDone resource"
      def list(domain, resource)
        connection(domain)
        @c.list(resource)
      end
      
    end
  end
end