class Game

    @@turn_count = 1
    @@choices = ["Green", "Blue", "Orange", "Yellow", "Purple", "Red", "Pink"]
    @@black_point = 0
    @@white_point = 0
    @@winner = ""
    @codebreaker_input_counter = 0
    @codebreaker_input = ""
    @@codebreaker_array = []
    @@codebreaker_game_counter = 0
    @@codebreaker_running_list = []
    @computer_choice_codebreaker = []
    @black_point = 0
    @white_point = 0


    def initialize
        puts "Hello, welcome to mastermind!"
        puts "If you get the colors correct, but not the order, you get a white ball."
        puts "If you get the colors correct, and the order, you get a white ball."
        puts "Please choose whether you want to be codemaker, or codebreaker"
        input = ""
        until input == 1 || input == 2
            puts "Type \"1\" to be a codemaker, and \"2\" to be a codebreaker."
            input = gets.chomp.to_i

        end
        @player_selection = input

    end

    def play_game
        if @player_selection == 1
            codemaker_game
        
        else
            codebreaker_game
        end
    end
    
    def color_choices
        colors = ["Green", "Blue", "Orange", "Yellow", "Purple", "Red", "Pink"]
    end

    def color_selector
        official_choices = []
        local_choices = color_choices
        choice_one = ""
        until local_choices.any?(choice_one)
            puts "Please choose your first of four colors:"
            choice_one = gets.chomp
        end

        official_choices.push(choice_one)
        local_choices.delete(choice_one)


        puts "Awesome blossom! I've always loved the color #{choice_one}."
        puts "Bear in mind, you can't choose the same color twice."

        puts local_choices.join(", ")
        choice_two = ""
        until local_choices.any?(choice_two)
            puts "Better choose your second color from the updated list now:"
            puts local_choices
            choice_two = gets.chomp
        end
        official_choices.push(choice_two)
        local_choices.delete(choice_two)

        puts "#{choice_two} is a great color!"
        puts "What do you want your third color to be?!"
        choice_three = ""

        until local_choices.any?(choice_three)
            puts "Please choose a color from the updated list:"
            puts local_choices
            choice_three = gets.chomp
        end

        official_choices.push(choice_three)
        local_choices.delete(choice_three)

        puts "Ahhh.... #{choice_three}..."
        puts "So, what's it going to be in this final choice?!"

        choice_four = ""
        until local_choices.any?(choice_four)
            puts "Please choose a color from the updated list:"
            puts local_choices
            choice_four = gets.chomp
        end

        official_choices.push(choice_four)
        local_choices.delete(choice_four)

        puts "Classy! Here's all the colors you chose: #{official_choices.join(", ")}"
        return official_choices



    end

    def round_player_against_computer(player_choice_array)
        while @@turn_count <=12 && @@winner.empty?
            puts "Round: #{@@turn_count}"
            random_computer_choice = computer_choice


            player_choice_array.each_with_index do |player_color, player_slot|
            random_computer_choice.each_with_index do |computer_color, computer_slot|
                if player_color == computer_color && player_slot == computer_slot
                    @@black_point+=1
                         end

                if player_color == computer_color && player_slot != computer_slot
                    @@white_point+=1
                        end

                    end
                end
            
            if player_choice_array == random_computer_choice
                puts "Computer chose: #{random_computer_choice}"
                puts "So, the computer miraculously won!"
                break
            elsif player_choice_array != random_computer_choice && @@winner.empty? && @@turn_count == 12
                @@winner == "Player"
                puts "Congrats, you beat the computer!"
            else

            end

            puts "The computer scored this many black points: #{@@black_point}."
            puts "And the computer scored this many white points: #{@@white_point}."
            puts "Type anything to continue..."
            input = gets.chomp
            @@turn_count+=1
        end
    end

    def computer_choice
        all_computer_choices = []
        all_computer_choices = color_choices
        3.times {all_computer_choices.delete_at(rand(all_computer_choices.length))}
        puts "This is what the computer guessed:"
        all_computer_choices = all_computer_choices.shuffle
       puts all_computer_choices
       return all_computer_choices
    end

    def codemaker_game
        puts "Congratulations on becoming a mastermind!"
        puts "You can choose from the following colors: "
        puts color_choices.join(", ")
        official_choices = color_selector
        round_player_against_computer(official_choices)
    end



    def codebreaker_game
        @@codebreaker_game_counter = 0
        @computer_choice_codebreaker = computer_choice_codebreaker
        # puts "The computer chose:"
        # puts computer_choice_codebreaker
            until @@codebreaker_game_counter == 12
            @@codebreaker_array.clear
            @@codebreaker_running_list.clear
            @@codebreaker_running_list = @@choices
            @user_choices = codebreaker_input
            @@codebreaker_game_counter +=1
            puts "Your choices in the round were: #{@@codebreaker_array}"
            puts "For testing purposes only"
            puts "Computer Computer chose:"
            puts @computer_choice_codebreaker
            puts "You chose:"
            puts @@codebreaker_array


            point_checker
            puts @@white_point
            puts @@black_point


        end
    end


        def point_checker
            # puts "your array in point_checker"
            # puts @@codebreaker_array
            # puts "computer array in code checker"
            # puts @computer_choice_codebreaker
            @@codebreaker_array.each_with_index do |user_choice, user_slot|
                @computer_choice_codebreaker.each_with_index do |computer_choice, computer_slot|
                    if user_choice == computer_choice && user_slot == computer_slot  
                        @@black_point+=1
                        puts "You got a black point."
                    end   
                    if user_choice == computer_choice && user_slot != computer_slot
                        @@white_point+=1  
                        puts "you got a white point."      
                       
                    end       
                end
            end
            puts "all your white points are belong to us."
            puts @@white_point
            puts "and all your black points are belong to us."
            puts @@black_point
        end


    # use variables below:
    # @codebreaker_input_counter = 0
    # @codebreaker_input = ""
    # @@codebreaker_array = []
    # @@codebreaker_game_counter = 0

    def computer_choice_codebreaker
        all_computer_choices = []
        all_computer_choices = color_choices
        3.times {all_computer_choices.delete_at(rand(all_computer_choices.length))}
        all_computer_choices = all_computer_choices.shuffle
    #    puts all_computer_choices
       return all_computer_choices
    end

    def codebreaker_input
        while @@codebreaker_array.length != 4
           
            puts "Your choices are: #{@@codebreaker_running_list}"
            @codebreaker_input = gets.chomp
                if @@codebreaker_running_list.any?(@codebreaker_input) == false
                    puts "Please input a valid selection:"
                    @codebreaker_input = ""
                    next
                end
            @@codebreaker_array.push(@codebreaker_input)
            @@codebreaker_running_list -= @@codebreaker_array
            puts "You've currently chosen: #{@@codebreaker_array}"
            puts "Time to make another selection!"
                    # puts "The computer chose:"
        # puts @computer_choice_codebreaker

        end
    end



end

game = Game.new
game.play_game