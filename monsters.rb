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
        hurt(player.attack_power)
        if alive?
            player.hurt(@attack_power)
        end
        return "Hit monster for #{player.attack_power} points."
    end
end