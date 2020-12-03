class Cli

    def start 
        puts "Welcome to Rick's portal gun"
        puts " Loading........ Pickle Rick!"
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
        print "Enter a Selection: "
        gets.chomp
    end
    def list_locations
        Locations.all.each.with_index(1) do |location, index|
            puts "#{index}. #{location.name}"
        end
    end

end