class Api

    def self.base_url
        "https://rickandmortyapi.com/api"
    end

    def self.load_data
        load_locations
        load_characters
    end
    
    def self.load_characters
        
        number_of_pages_for_c = 34
        page_number_for_c = 0
   
        while page_number_for_c <= number_of_pages_for_c
            response_c = RestClient.get(base_url + "/character/?page=#{page_number_for_c}")
            data_c = JSON.parse(response_c.body)
            
            data_c["results"].each do |character_data|
              Character.new(character_data)
            end 

            if false
                break
            end
            page_number_for_c += 1
        end
    end

    def self.load_locations
        number_of_pages = 6
        page_number = 1
   
        while page_number <= number_of_pages
            response = RestClient.get(base_url + "/location/?page=#{page_number}")
            data = JSON.parse(response.body)
            
            data["results"].each do |location_data|
              Locations.new(location_data)
            end 
           
            if false
                break
            end
            page_number += 1
        end
    end
end
