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
      method_option :data, :type => :hash, :default => {}, :required => true
      method_option :domain, :aliases => "-d", :desc => "set domain", :required => true
      def create(resource)
        connection(options[:domain])
        puts @c.create(resource, options[:data])
      end
      
      map %w(--update -u) => 'update'
      desc "update", "Updates ApiDone resource"
      method_option :data, :type => :hash, :default => {}, :required => true
      method_option :domain, :aliases => "-d", :desc => "set domain", :required => true
      method_option :id, :desc => "set id", :required => true
      def update(resource)
        connection(options[:domain])
        puts @c.update(resource, options[:id], options[:data])
      end
      
      map %w(--destroy -d) => 'delete'
      desc "delete", "Delete ApiDone resource"
      method_option :data, :type => :hash, :default => {}, :required => true
      method_option :domain, :aliases => "-d", :desc => "set domain", :required => true
      method_option :id, :desc => "set id", :required => true
      def delete(resource)
        connection(options[:domain])
        puts @c.update(resource, options[:id])
      end
      
      map %w(--list -l) => 'list'
      desc "list", "List ApiDone resource"
      method_option :domain, :aliases => "-d", :desc => "set domain", :required => true
      def list(resource)
        connection(options[:domain])
        puts @c.list(resource)
      end
      
      map %w(--show -s) => 'show'
      desc "show", "Show ApiDone resource"
      method_option :domain, :aliases => "-d", :desc => "set domain", :required => true
      method_option :id, :desc => "set id", :required => true
      def show(resource)
        connection(options[:domain])
        puts @c.show(resource, options[:id])
      end
      
    end
  end
end