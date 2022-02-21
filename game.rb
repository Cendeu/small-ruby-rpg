Dir["./*.rb"].each {|file| require_relative file}
require 'io/console'
require 'colorize'

class Game
    UP = "\e[A"
    DOWN = "\e[B"
    RIGHT = "\e[C"
    LEFT = "\e[D"
    SPACE = " "
    T_KEY = "t"
    L_KEY = "l"

    ACTIONS = ["\e[A", "\e[B", "\e[C", "\e[D", " ", "t", "l"]

    def initialize
        @world = World.new
        @player = Player.new
        @painter = UI.new
        @last_action = ""

        start_game
    end

    private
    def start_game
        while @player.alive?
            @current_room = @world.get_room_of(@player)
            @painter.print_gui(@world, @player, @last_action)

            action = read_char
            next unless ACTIONS.include? action

            take_action(action)
        end
    end

    def print_status
        puts "You are at map coordinates [#{@player.x_coord}, #{@player.y_coord}]"

        puts @current_room
        if @current_room.content
            puts "You see #{@current_room.content}."
        end
    end

    def take_action(action)
        case action
        when :look
            print_status
        when "\e[D"
            @world.move_entity_north(@player)
        when "\e[C"
            @world.move_entity_south(@player)
        when "\e[B"
            @world.move_entity_east(@player)
        when "\e[A"
            @world.move_entity_west(@player)
        when " "
            @last_action = @current_room.interact(@player)
        when "l"
            @player.print_status
        when "t"
            exit
        end
    end


    def read_char
        STDIN.echo = false
        STDIN.raw!
    
        input = STDIN.getc.chr
        if input == "\e" then
            input << STDIN.read_nonblock(3) rescue nil
            input << STDIN.read_nonblock(2) rescue nil
        end
    ensure
        STDIN.echo = true
        STDIN.cooked!
    
        return input
    end

end

Game.new