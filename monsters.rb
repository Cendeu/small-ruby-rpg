require_relative "combatable.rb"

class Monster
    include Combatable

    def initialize
        initialize_stats(BASE_STATS)
        bonus_health = rand(20)
        @hit_points += bonus_health
        @max_hit_points += bonus_health
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
        return "Hit monster for #{player.attack_power} points." unless not alive?
        return "You killed the Monster!"
    end
end