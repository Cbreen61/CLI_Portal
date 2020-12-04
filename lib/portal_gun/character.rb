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
end
