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
        heal_amount = rand(5) + 7
        player.heal(heal_amount)
        return "You heal #{heal_amount}"
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
        ap_amount = rand(3)
        player.attack_power += ap_amount
        return "You gain #{ap_amount} AP!"
    end
    
    def tile
        "S"
    end
end