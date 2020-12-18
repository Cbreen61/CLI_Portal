class Cli

    def start
        puts ":`                                                          
                                        hy/.                                                        
                                        h/-+/.              :s                                      
                                        h/..+y.          `-++d`                                     
                                       `h:...-++`      `:o/.-d`                                     
                                       d:......-d`    /o/...-d`                                     
                                       d:........o/ /o:.....-d`                                     
                          hsoooo+////:`d:.........-+-........-h     .//osh                          
                          .y-....-----+y-....................-m`-:+o/--.-d                          
                           .s:............:/+oooooooooo+/:...-hs::....../s                          
                            -o/........-+s+/-``````````-/+s+-..........:h                           
                             -+/.......h.``````````````````.h.........:+:                           
                               +s.....d.````````````````````.d.......+s                             
                      `+++++++++o/...d.hsoohh+/``````/++ooosh.d..../hh++++++                        
                       `s+-..........m.oods+o/-oooooo-/o+sdoo.m.........-+o`                        
                         .+/+-.......m.``:+++sdssssssds+++:``.m......-+/+.                          
                           .-+/-.....m.-+::::::o-``-o::::::+-.m....-+/-.                            
                              -o/....m.dsooyyoosd``dsooyyoosd.m...+o-                               
                            `:+:.....m.d.  --  `d``d`  --  .d.m....:+:                              
                           /+:....-oom.//.``  .+/``/+.``` .//.moo-...:o/`                           
                           /++++//d``m././++++/.+``+./++++/./.m``d//++oo/                           
                              -o+:s/`m.`+oooo/`.d``d.`/oooo+`.m`/s:+o-                              
                             -o+...:sm.````````.d``d.````````.ms:...+o-                             
                            /yyoo+:..m.``-.`````:oo:`````.-``.m..:+ooyy/                            
                                `/h.:m.`o/...............-/o`.m:.h/`                                
                                +h-od/o`y:.:///+NyyyyNs/+/:y`o/do-h+                                
                                -+/  `d.`:+-````omo+yN/`-+:`.d`  /+-                                
                                       /+.```````sNho.````.+/                                       
                                        `/so+:````..``:+os/`                                        
                                           `.:oooooooo:.`  ".colorize(:cyan)
      sleep 3
        puts"
        ██████╗ ██╗ ██████╗██╗  ██╗███████╗               
        ██╔══██╗██║██╔════╝██║ ██╔╝██╔════╝               
        ██████╔╝██║██║     █████╔╝ ███████╗               
        ██╔══██╗██║██║     ██╔═██╗ ╚════██║               
        ██║  ██║██║╚██████╗██║  ██╗███████║               
        ╚═╝  ╚═╝╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝               
                                                          
        ██████╗  ██████╗ ██████╗ ████████╗ █████╗ ██╗     
        ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗██║     
        ██████╔╝██║   ██║██████╔╝   ██║   ███████║██║     
        ██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║     
        ██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║███████╗
        ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝
                                                  
                 ██████╗ ██╗   ██╗███╗   ██╗              
                ██╔════╝ ██║   ██║████╗  ██║              
                ██║  ███╗██║   ██║██╔██╗ ██║              
                ██║   ██║██║   ██║██║╚██╗██║              
                ╚██████╔╝╚██████╔╝██║ ╚████║              
                 ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝ ".colorize(:green)
                
        sleep 3
        puts "Loading........ I'm Pickle Rick!".colorize(:cyan)
        Api.load_data
        home_screen_options
    end

    def home_screen_options
        puts "Type 'L' to browse locations".colorize(:green)
        puts "Type 'C' to browse characters" .colorize(:cyan)
        puts "Type 'Exit' to leave the portal gun".colorize(:green)
        home_screen
    end

    def home_screen
        input = user_choice

        if input == "L"
            list_locations
            puts "Selecta a location for more details".colorize(:green)
            home_screen_options
        elsif input == "C"
            list_characters
            puts "Select a Character for more details".colorize(:green)
            home_screen_options
        elsif input == "Exit"
            puts "Leaving Portal gun".colorize(:green)
            puts "wabba lubba dub dub".colorize(:cyan)
            exit 
        else
            invalid_selection
            home_screen_options
        end
    end

    def invalid_selection
        puts "You've selected and incorrect choice, stop being a Jerry and try again!".colorize(:light_red)
    end

    def user_choice
        print "Enter a selection: ".colorize(:yellow)
        gets.chomp
    end
    def list_locations
        Locations.all.each.with_index(1) do |location, index|
            puts "#{index}. #{location.name}".colorize(:cyan)
        end

        location_infromation_menu_options
    end
    def location_infromation_menu_options
        puts "Select the number associated with location you want more detials on.".colorize(:green)
        puts "Or type 'Exit' to leave the portal gun".colorize(:cyan)
        location_details_menu
    end

    def location_details_menu
        input = user_choice

        if input.to_i.between?(1, Locations.all.length)
            index = input.to_i - 1
            location = Locations.all[index]
            print_location_details(location)
            reselect_or_exit
        elsif input == "Exit"
            puts "Leaving Portal gun".colorize(:green)
            puts "wabba lubba dub dub".colorize(:cyan)
            exit 
        else
            invalid_selection
            location_infromation_menu_options
        end
    end
    
    def print_location_details(location)
        puts "________________________".colorize(:red)
        sleep 1
        puts "Location Name: #{location.name}".colorize(:green)
        puts "Location Type: #{location.type}".colorize(:cyan)
        puts "Location Dimension: #{location.dimension}".colorize(:green)
        # puts "Residents of Location: #{location.residents_url}"
        
        puts "________________________".colorize(:red)
    end
    def reselect_or_exit
        puts "Would you like to choose again or return to the home screen?".colorize(:green)
        puts "'1' for the main menu".colorize(:cyan)
        puts "'Exit' to exit portal gun".colorize(:green)
        input = user_choice

        if input == '1'
            home_screen_options
        elsif input == "Exit"
            puts "Leaving Portal gun".colorize(:green)
            sleep 1
            puts "wabba lubba dub dub".colorize(:cyan)
            exit 
        else
            invalid_selection
            reselect_or_exit
        end
    end

    def list_characters
        Character.all.each.with_index(1) do |character, index|
            puts "#{index}. #{character.name}".colorize(:green)
        end

        character_information_menu_options
    end
    def character_information_menu_options
        puts "Select the number associated with character you want more detials on.".colorize(:green)
        puts "Or type 'Exit' to leave the portal gun".colorize(:cyan)
        character_details_menu
    end

    def character_details_menu
        input = user_choice

        if input.to_i.between?(1, Character.all.length)
            index = input.to_i - 1
            character = Character.all[index]
            print_character_details(character)
            reselect_or_exit
        elsif input == "Exit"
            puts "Leaving Portal gun".colorize(:green)
            puts "wabba lubba dub dub".colorize(:cyan)
            exit 
        else
            invalid_selection
            character_information_menu_options
        end
    end
    
    def print_character_details(character)
        puts "________________________".colorize(:red)
        sleep 1
        puts "Character Name: #{character.name}".colorize(:green)
        puts "Character Status: #{character.status}".colorize(:cyan)
        puts "Character Species: #{character.species}".colorize(:green)
        # puts "Character Type: #{character.type}"
        # puts "Character Dimension: #{character.location}"
        puts "________________________".colorize(:red)
    end

end