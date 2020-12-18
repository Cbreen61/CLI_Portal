class Character 
    attr_accessor :name, :status, :species
    @@characters = []
    
    def initialize(data)
        self.name = data["name"]
        self.status = data["status"]
        self.species = data ["species"]
    
        @@characters << self

    end

    def self.all
        @@characters.first(150)
    end

    def self.find_by_name(name)
        Character.all.find{ |characters| characters.name == name}
        name
    end
    
    def self.return_names
        Character.all.map do |character|
        character.name
       end
    end

end
