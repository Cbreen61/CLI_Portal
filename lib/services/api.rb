class Api

    def self.base_url
        "https://rickandmortyapi.com/api"
    end

    def self.load_data
        load_locations
    end
       

    def self.load_locations
        locations = []
        response = RestClient.get(base_url + '/location')
        data = JSON.parse(response.body)
        data["results"].each do |location_data|
            Locations.new(location_data)
        end 
    end
end
