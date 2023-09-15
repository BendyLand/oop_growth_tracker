class Pet
    @@weeks_tracked = 0
    @@pets = []

    attr_reader :name, :animal, :color, :pets, :weeks_tracked
    attr_accessor :lengths, :weights

    def initialize(name, animal, color)
        @name = name
        @animal = animal
        @color = color
        @growth_data = []
        @@pets.push(self)
    end
    
    def add_data(date, length, weight)
        @growth_data.push({
            date: date, 
            length: length,
            weight: weight
        })
        @@weeks_tracked += (1.0 / @@pets.length)
    end

    def show_most_recent()
        if @growth_data.empty? then return nil end
        puts "\n#{@name} was #{@growth_data[-1][:length]} inches and #{@growth_data[-1][:weight]} grams on #{@growth_data[-1][:date]}."
        puts "We've been tracking for #{@@weeks_tracked.to_i} weeks."
    end

    def remove_most_recent()
        @growth_data.pop()
    end

    def self.show_pets()
        str = "\n"
        for pet in @@pets
            if not pet.name.nil?
                str += pet.name + ", "
            end
        end
        puts str[0...-2]
    end
end

reese = Pet.new("Reese", "Guinea Pig", "Brown")
puff = Pet.new("Puff", "Guinea Pig", "White")

reese.add_data("09/07/23", 7.5, 510)
reese.add_data("09/14/23", 7.75, 550)

puff.add_data("09/07/23", 8, 623)
puff.add_data("09/14/23", 8.63, 709)

reese.show_most_recent()
puff.show_most_recent()

Pet.show_pets()