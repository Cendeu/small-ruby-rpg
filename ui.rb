require_relative "world"
require 'colorize'
class UI


    def initialize
        @painter = {
            UI_HORIZONTAL: "\u2501".light_black,
            UI_VERTICAL: "\u2503".light_black,
            UI_TOP_LEFT: "\u250F".light_black,
            UI_TOP_RIGHT: "\u2513".light_black,
            UI_BOTTOM_LEFT: "\u2517".light_black,
            UI_BOTTOM_RIGHT: "\u251B".light_black,
            MAP_PLAYER: "\u1330".yellow,
            MAP_POTION: "\u26B1".cyan,
            MAP_MONSTER: "\u046A".red,
            MAP_SWORD: "\u2540".white,
            MAP_GRASS: [",", ".", "'", "\u02C0", "\u02C1", "\u02D5"]
        }
    end

    def clear
        print "\e[H\e[2J"
    end

    def print_gui(world, player)
        current_room = world.get_room_of(player)
        clear
        player.print_status
        paint_map(world.rooms, player)
        puts current_room
        if current_room.content
            puts "You see #{current_room.content}."
        end
    end

    def paint_map(map, player)
        x = 0
        print @painter[:UI_TOP_LEFT]
        print @painter[:UI_HORIZONTAL] * 20
        print @painter[:UI_TOP_RIGHT]
        print "\n"
        map.each do |row|
            y = 0
            print @painter[:UI_VERTICAL]
            row.each do |room|
                if player.x_coord == x && player.y_coord == y
                    print @painter[:MAP_PLAYER]
                elsif room.symbol == nil
                    room.symbol = get_symbol_of room
                    print room.symbol
                else
                    print room.symbol
                end
                print " "
                y += 1
            end
            print @painter[:UI_VERTICAL]
            print "\n"
            x += 1
        end
        print @painter[:UI_BOTTOM_LEFT]
        print @painter[:UI_HORIZONTAL] * 20
        print @painter[:UI_BOTTOM_RIGHT]
        print "\n"
    end

    def get_symbol_of(room)
        if room.class == Room
            case room.content
            when Potion
                return @painter[:MAP_POTION]
            when Sword
                return @painter[:MAP_SWORD]
            when Monster
                return @painter[:MAP_MONSTER]
            when NilClass
                @painter[:MAP_GRASS].sample.light_green
            end
        end
    end

end

