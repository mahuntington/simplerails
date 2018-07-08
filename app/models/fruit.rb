class Fruit
    if(ENV['DATABASE_URL'])
        uri = URI.parse(ENV['DATABASE_URL'])
        DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
    else
        DB = PG.connect(host: "localhost", port: 5432, dbname: 'simplerails')
    end

    def self.all
        results = DB.exec("SELECT * FROM fruits;")
        results.map do |fruit_opts|
            fruit_opts["id"].to_i
            {
                id: fruit_opts["id"].to_i,
                name: fruit_opts["name"],
                color: fruit_opts["color"],
                readyToEat: (fruit_opts["readytoeat"] == "t") ? true : false
            }
        end
    end

    def self.find(id)
        results = DB.exec("SELECT * FROM fruits WHERE id=#{id};")
        {
            id: results.first["id"].to_i,
            name: results.first["name"],
            color: results.first["color"],
            readyToEat: (results.first["readytoeat"] == "t") ? true : false
        }
    end

    def self.create(opts={})
        results = DB.exec("INSERT INTO fruits (name, color, readytoeat) VALUES ( '#{opts[:name]}', '#{opts[:color]}', #{opts[:readyToEat]} );")
        { created: true }
    end

    def self.delete(id)
        results = DB.exec("DELETE FROM fruits WHERE id=#{id};")
        { deleted: true }
    end

    def self.update(id, opts={})
        results = DB.exec("UPDATE fruits SET name='#{opts[:name]}', color='#{opts[:color]}', readytoeat=#{opts[:readyToEat]} WHERE id=#{id} ;")
        { updated: true }
    end
end
