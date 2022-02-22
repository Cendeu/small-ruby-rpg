class World
    attr_reader :rooms
    WORLD_WIDTH = 10
    WORLD_HEIGHT = 10

    def initialize
        @rooms = []
        temp_row = []
        WORLD_HEIGHT.times.each do
            WORLD_WIDTH.times.each do
                temp_row << Room.new
            end
            @rooms << temp_row
            temp_row = []
        end
    end

    def move_entity_north(entity)
        entity.y_coord -= 1 if entity.y_coord > 0
    end

    def move_entity_south(entity)
        entity.y_coord += 1 if entity.y_coord < WORLD_HEIGHT - 1
    end

    def move_entity_east(entity)
        entity.x_coord += 1 if entity.x_coord < WORLD_WIDTH - 1
    end

    def move_entity_west(entity)
        entity.x_coord -= 1 if entity.x_coord > 0
    end

    def get_room_of(entity)
        @rooms[entity.x_coord][entity.y_coord] ||= Room.new
    end
end

class Room
    attr_accessor :size, :content, :symbol

    def initialize
        @content = get_content
        @size = get_size
        @adjective = get_adjective
    end

    def interact(player)
        if @content
            phrase = @content.interact(player)
            if @content.class != Monster
                @content = nil
                @symbol = nil
            elsif not @content.alive?
                @content = [nil, nil, [Potion, Sword].sample.new].sample
                @symbol = nil
            end
            return phrase
        end
    end

    def to_s
        "You are in a #{size} room. It is #{@adjective}."
    end

    private
    def get_content
        [[Monster, [Potion, Sword].sample].sample.new, nil].sample
    end

    def get_size
        ["tiny", "normal sized", "gigantic"].sample
    end

    def get_adjective
        ["smelly", "beautiful", "plain", "full of plants"].sample
    end
end