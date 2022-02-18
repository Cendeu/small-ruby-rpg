class Item
    def interact(player)
        puts "You pick up #{self}"

        perform_item_effect(player)
    end

    def to_s
        "a shiny #{@name}"
    end
    
end

class Potion < Item
    def initialize
        @name = "potion"
    end

    def perform_item_effect(player)
        player.heal(rand(5) + 7)
    end

    def tile
        "P"
    end
end

class Sword < Item
    def initialize
        @name = "sword"
    end

    def perform_item_effect(player)
        player.attack_power += 1
    end
    
    def tile
        "S"
    end
end