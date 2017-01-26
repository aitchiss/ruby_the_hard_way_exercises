
require "./ex45_2.rb"

#actual gameplay

class Adventure
    
    def initialize
        puts "What is your best friend's name?"
        @friend = gets.chomp
        puts "It's a dark night, and you are walking home from a country pub with #{@friend}.\nYou see an abandoned old house. Against your advice, #{@friend} decides to go in and explore.\nYou wait...\nand wait... \nand wait...\nSuddenly you hear #{@friend} scream!\nWill you enter the house to save #{@friend}?\nEnter yes or no:"
        brave = gets.chomp.downcase
        
            if brave == "yes"
                #initialize corridor... hide friend in a room
                @friend_location = rand(3) + 1
                AllRooms::Corridor.new(@friend, @friend_location)
            else
                puts "Oh well, I guess #{@friend} is dead then."
                exit(0)
            end
    end
        
end

Adventure.new


