class Api

    def self.base_url
        "https://rickandmortyapi.com/api"
    end

    def self.load_data
        load_locations
    end
       

    def self.load_locations
        page = 0
   
        while true
            response = RestClient.get(base_url + "/location/?page=#{page}")
            data = JSON.parse(response.body)

            data["results"].each do |location_data|
              Locations.new(location_data)
            end 
            
            if data["id"].nil?
                break
            end
            page += 1
        end
    end
end
