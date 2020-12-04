class Cli

    def start 
        puts "Welcome to Rick's portal gun"
        puts " Loading........ I'm Pickle Rick!"
        Api.load_data
        home_screen_options
    end

    def home_screen_options
        puts "Type 'L' to browse locations"
        puts "Type 'C' to browse characters" 
        puts "Type 'Exit' to leave the portal gun"
        home_screen
    end

    def home_screen
        input = user_choice

        if input == "L"
            list_locations
            puts "select location for more details"
            home_screen_options
        elsif input == "C"
            puts "Displaying Characters"
        elsif input == "Exit"
            puts "Leaving Portal gun"
            exit 
        else
            invalid_selection
            home_screen_options
        end
    end

    def invalid_selection
        puts "You've selected and incorrect choice, stop being a Morty and try again!"
    end

    def user_choice
        print "Enter a selection: "
        gets.chomp
    end
    def list_locations
        Locations.all.each.with_index(1) do |location, index|
            puts "#{index}. #{location.name}"
        end

        location_infromation_menu_options
    end
    def location_infromation_menu_options
        puts "Select the number associated with location you want more detials on."
        puts "Or type 'Exit' to leave the portal gun"
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
            puts "Leaving Portal gun"
            exit 
        else
            invalid_selection
            location_infromation_menu_options
        end
    end
    
    def print_location_details(location)
        puts "________________________"
        puts "Location Name: #{location.name}"
        puts "Location Type: #{location.type}"
        puts "Location Dimension: #{location.dimension}"
        puts "_________________________"
    end
    def reselect_or_exit
        puts "Would you like to choose again or return to the home screen?"
        puts "'1' for the main menu"
        puts "'Exit' to exit portal gun"
        input = user_choice

        if input == '1'
            home_screen_options
        elsif input == "Exit"
            puts "Leaving Portal gun"
            exit 
        else
            invalid_selection
            reselect_or_exit
        end
    end
end