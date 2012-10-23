module Apidone
  module Client
    class Resource
      
      attr_reader :data
      def initialize(data ={})
        @data = data
        meta_fields(data)
      end
      
private
      def meta_fields(data)
        data.keys.each do |key|
          instance_eval <<-RUBY
            def #{key}
              "#{data[key]}"
            end
          RUBY
        end
      end

    end
  end
end