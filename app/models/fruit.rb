class Fruit
    DB = PG.connect(host: "localhost", port: 5432, dbname: 'simplerails')

    def initialize(opts = {})
        @id = opts["id"].to_i
        @name = opts["name"]
        @color = opts["color"]
        @readyToEat = (opts["readytoeat"]=='t')?true:false
    end

    def self.all
        results = DB.exec("SELECT * FROM fruits;")
        return results.map { |fruit_opts| Fruit.new(fruit_opts)}
    end

    def self.find(id)
        results = DB.exec("SELECT * FROM fruits WHERE id=#{id};")
        return Fruit.new(results.first)
    end
end
