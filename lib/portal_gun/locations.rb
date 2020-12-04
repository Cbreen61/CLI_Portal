class Locations
    attr_accessor :name, :type, :dimension #:residents_url, :residents

    @@all =[]

    def initialize(data)
        self.name = data["name"]
        self.type = data["type"]
        self.dimension = data["dimension"]
        #self.residents_url = data["residents"]
        @@all << self

    end

    def self.all
        @@all.first(20)
    end
end
