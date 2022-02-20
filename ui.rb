class UI


    def initialize
        @painter = {
            UI_HORIZONTAL: "\u2501",
            UI_VERTICAL: "\u2503",
            UI_TOP_LEFT: "\u250F",
            UI_TOP_RIGHT: "\u2513",
            UI_BOTTOM_LEFT: "\u2517",
            UI_BOTTOM_RIGHT: "\u251B",
            MAP_PLAYER: "\u1330",
            MAP_POTION: "\u25B2"
        }
    end

    def clear
        print "\e[H\e[2J"
    end

    def paint_map(map, player)
        x = 0
        map.each do |row|
            y = 0
            row.each do |room|
                if player.x_coord == x && player.y_coord == y
                    print @painter[:MAP_PLAYER]
                else
                    print get_symbol_of room
                end
                y += 1
            end
            print "\n"
            x += 1
        end
    end

    def get_symbol_of(room)
        if room.class == Room
            case room.content
            when Potion
                return @painter[:MAP_POTION]
            when Sword
                return "S"
            when Monster
                return "M"
            when NilClass
                "O"
            end
        end
    end

end

