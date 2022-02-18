class UI

    def initialize
    end

    def clear
        print "\e[H\e[2J"
    end

    def paint_map(map)
        map.each do |row|
            row.each do |room|
                print room.content.tile
            end
            print "\n"
        end
    end

    def get_room_symbol(room)
        if room.class == Room
            case room.content
            when :Potion
                return "P"
            when :Sword
                return "S"
            when :Monster
                return "M"
            else
                "O"
            end
        end
    end

end