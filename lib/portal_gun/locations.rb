class Locations 
    attr_accessor :name, :type, :dimension

    @@locations =[]

    def initialize(data)
        self.name = data["name"]
        self.type = data["type"]
        self.dimension = data["dimension"]
        @@locations << self

    end

    def self.all
        @@locations.first(110)
    end
end
