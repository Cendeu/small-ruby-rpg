require "colorize"

class Title_Screen
    attr_reader :name, :press_enter
    def initialize

        @name = """                                                                 
                                                                             ,dPYb,     
                                                                             IP'`Yb     
                                                                             I8  8I     
                                                                             I8  8'     
           ,gggg,gg    ,gggg,gg   ,ggg,,ggg,,ggg,    ,ggg,         ,gggggg,  I8 dP      
          dP\"  \"Y8I   dP\"  \"Y8I  ,8\" \"8P\" \"8P\" \"8,  i8\" \"8i        dP\"\"\"\"8I  I8dP   88gg
         i8'    ,8I  i8'    ,8I  I8   8I   8I   8I  I8, ,8I       ,8'    8I  I8P    8I  
        ,d8,   ,d8I ,d8,   ,d8b,,dP   8I   8I   Yb, `YbadP'  d8b ,dP     Y8,,d8b,  ,8I  
        P\"Y8888P\"888P\"Y8888P\"`Y88P'   8I   8I   `Y8888P\"Y888 Y8P 8P      `Y88P'\"Y88P\"'  
               ,d8I'                                                                    
             ,dP'8I                                                                     
            ,8\"  8I                                                                     
            I8   8I                                                                     
            `8, ,8I                                                                     
            `Y8P\"       
                                by Spencer Biri
        """.red

        @press_enter = "                         Press Any Key to start game".white.on_black.blink
    end

    def print_title_screen
        print @name + "\n"
        puts @press_enter
    end
end
