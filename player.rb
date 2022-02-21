require_relative "combatable"
require "colorize"

class Player
    include Combatable
    attr_accessor :x_coord, :y_coord

    MAX_HIT_POINTS = 100
    AP = 1

    def initialize
        initialize_stats(BASE_STATS.merge ({
            max_hit_points: MAX_HIT_POINTS,
            attack_power: AP
        }))

        @x_coord, @y_coord = 0, 0
    end

    def print_status
        print  "\u250F" + ("\u2501" * 30) + "\u2513\n"
        print "\u2503"
        print "\u2665".red #heart
        print " HP: #{"%03d" % @hit_points} / #{MAX_HIT_POINTS}" + (" " * 15) +  "\u2503\n"
        print "\u2503"
        print "\u2694"
        print " AP: #{"%02d" % attack_power}" + (" " * 22) +  "\u2503\n"
        puts "\u2517" + "\u2501" * 30 + "\u251B"
    end

end