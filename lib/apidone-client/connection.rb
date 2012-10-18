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
        data
      end
  
      def update(name, id, data = {})
        response = @conn.put "/#{name}/#{id}", data
    
        if response.status == 201
          json_response = JSON.parse(response.body)
        end
        
        data
      end
  
      def list(name)
        response = @conn.get "/#{name}"
        JSON.parse response.body
      end
  
      def show(name, id)
        response = @conn.get("/#{name}/#{id}")
        JSON.parse response.body
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