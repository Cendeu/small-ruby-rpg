require_relative "combatable.rb"

class Monster
    include Combatable

    def initialize
        initialize_stats(BASE_STATS)
    end

    def to_s
        "a horrible monster! HP:#{@hit_points} / #{@max_hit_points}"
    end

    def tile
        "M"
    end

    def interact(player)
        puts "You hit the monster for #{player.attack_power} points."
        hurt(player.attack_power)
        if alive?
            player.hurt(@attack_power)
            puts "The monster hits you for #{@attack_power} points."
        end
    end
end