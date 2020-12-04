class Locations 
    attr_accessor :name, :type, :dimension, :residents_url, :residents

    @@locations =[]

    def initialize(data)
        self.name = data["name"]
        self.type = data["type"]
        self.dimension = data["dimension"]
        self.residents_url = data["residnts"]
        @@locations << self

    end

    def self.all
        @@locations.first(110)
    end
end
