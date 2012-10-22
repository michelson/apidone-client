module Apidone
  module Client
    class Connection
  
      API_DONE_URL = "apidone.com"
     
      attr_accessor :subdomain, :conn
  
      def initialize(subdomain)
        @subdomain = subdomain
    
        @conn = Faraday.new(:url => self.endpoint_url) do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          #faraday.response :logger                  # log requests to STDOUT
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
  
      def endpoint_url
        "http://#{subdomain}.#{API_DONE_URL}"
      end
  
      def create(name, data = {})
        response = @conn.post "/#{name}", data
        if response.status == 201
            json_response = JSON.parse(response.body)
            data[:id] = json_response["id"]
        end
        Apidone::Client::Resource.new( json_response)
      end
  
      def update(name, id, data = {})
        response = @conn.put "/#{name}/#{id}", data
        if response.status == 201
          json_response = JSON.parse(response.body)
        end
        Apidone::Client::Resource.new data
      end
  
      def list(name)
        response = @conn.get "/#{name}"
        collection = JSON.parse response.body
        collection.collect{|o| Apidone::Client::Resource.new(o)}
      end
  
      def show(name, id)
        response = @conn.get("/#{name}/#{id}")
        Apidone::Client::Resource.new(JSON.parse response.body)
      end
      
      def delete(name , id)
        response = @conn.delete "/#{name}/#{id}"
        if response.status == 204
          return true
        end
      end
  
    end
  end
end