module AllRooms

#all of the rooms - not sure if this is useful yet
class Room
    
    def see_friend(friend)
        puts "You make eye contact with #{friend}, who is standing in the corner."
    end
    
    def no_friend(friend)
        puts "#{friend} isn't here; they must be in another room of the house."
    end
    
    def win(friend)
        puts "You and #{friend} take the opportunity to peg it out of the house.\nCongratulations - you survived!"
        exit(0)
    end
    
    def not_found(friend)
        puts "You still haven't found #{friend}."
    end
    
end

#right of corridor = Dining Room. Room location number 2
class DiningRoom < Room
    
    def initialize(friend, friend_location)
        puts "You step into a grand room full of ornate furnishings and dominated by a long dining table...\nIt would look beautiful if it were not for the five-legged squishy-looking monster sitting on it."
        dining_scenario(friend, friend_location)
    end
    
    #the actual part of what happens in the dining room - separated out from initialize function
    def dining_scenario(friend, friend_location)
        if friend_location == 2
            see_friend(friend)
        else
            no_friend(friend)
        end
        puts "The monster starts growling at you. How do you get away from the monster without being torn apart?\nDo you go tickle the monster, or do you walk over and punch it on the nose?\nEnter 'tickle' or 'punch':"
        @choice = gets.chomp.downcase
        if @choice == "tickle"
            puts "You tentatively walk over and tickle the monster. It immediately stops growling, giggles and licks your face."
            if friend_location == 2
                win(friend)
            else
                destination(friend, friend_location)
            end
        elsif @choice == "punch"
            puts "You punch the monster in the face, but it doesn't like it!\nThe monster gobbles you whole and you die, destined to be another ghost haunting the house forever."
            exit(0)
        end
    end
    
    #decide where to go next if friend still not found
    def destination(friend, friend_location)
        not_found(friend)
        puts "You see a doorway in the corner leading to the kitchen.\nDo you go into the kitchen, or back to the corridor?\nEnter 'kitchen' or 'corridor':"
        @choice = gets.chomp.downcase
        if @choice == "kitchen"
            Kitchen.new(friend, friend_location)
        elsif @choice == "corridor"
            Corridor.new(friend, friend_location)
        end
    end
end


#accessed via the dining room only. Room location number 3
class Kitchen < Room
    
    def initialize(friend, friend_location)
        puts "You enter the kitchen."
        kitchen_scenario(friend, friend_location)
    end
    
    def kitchen_scenario(friend, friend_location)
        
        if friend_location == 3
            see_friend(friend)
            puts "You turn to leave with them, but suddenly..."
        else
            no_friend(friend)
            puts "There's only one way back out.\nYou turn to leave, but suddenly..."
        end
        
        puts "You see a huge, and rather angry looking, ghost in the doorway.\nYou need to get past the ghost to leave!\nDo you run straight through it, and hope for the best, or do you taunt the ghost first?\nEnter 'run' or 'taunt':"
        
        @choice = gets.chomp.downcase
        if @choice == "run"
            puts "You run full pelt at the ghost. As you make contact with it you instantly vaporize.\nOh well, you tried! Alas, you are now destined to haunt the house forever."
            exit(0)
        elsif @choice  == "taunt"
            puts "You throw some nasty taunts at the ghost.\nThe ghost breaks into floods of tears and runs away.\nWho knew ghosts were so sensitive!"
            if friend_location == 3
                win(friend)
            else
                not_found(friend)
                puts "You walk back to the corridor."
                Corridor.new(friend, friend_location)
            end
        end
        
    end
    
end

#Room location number 4
class Cellar < Room
    
    def initialize(friend, friend_location)
        @brave = nil
        
        until @brave == "yes"
            puts "You hesitate, are you sure you want to go down there?"
            @brave = gets.chomp.downcase
        end
        
        puts "You tentatively creep down the stairs, and walk into the centre of a very dark room."
        cellar_scenario(friend, friend_location)
    end
    
    def cellar_scenario(friend, friend_location)
        if friend_location == 4
            see_friend(friend)
            puts "You shout and get their attention - it's time to leave!"
        else
            no_friend(friend)
        end
        
        puts "You turn to walk back up the stairs, when you suddenly become aware of a circle of bodies moving closer to you.\nAs they near you see they are vampires! You're surrounded!\nIn a bid to get away, will you scream at the top of your lungs, or burst into song?\nEnter 'scream' or 'song':"
        @choice = gets.chomp.downcase
        
        if @choice == "scream"
            puts "You scream your loudest - AAAAAAAAAAARGH!\nBut it only agitates the vampires. They jump on you and drink your blood.\nYou become one of the undead, doomed to live as a vampire in this cellar forever!"
            exit(0)
        elsif @choice == "song"
            puts "You burst into a rendition of 'I Will Survive'.\nSurprisingly, the vampires enjoy this and stage an impromptu dance-off.\nWhile they're pre-occupied, you make a break for it."
            if friend_location == 4
                win(friend)
            else
                not_found(friend)
                puts "You head back to the main corridor as fast as you can."
                Corridor.new(friend, friend_location)
            end
        end

        
    end
    
end

#left of corridor = Study. Room location number 1
class Study < Room
    
    def initialize(friend, friend_location)
        puts "You push open the door on the left, and see a musty old study room, with walls lined with books."
        #if statement added to check if the friend is in this room or not, according to the random generation in Adventure
        if friend_location == 1
            see_friend(friend)
            puts "and then suddenly..."
            study_scenario(friend, friend_location)
            else
            no_friend(friend)
            puts "You look around the room for a moment, when suddenly..."
            study_scenario(friend, friend_location)
        end
    end
    
    #adding this as a separate method so I don't have to duplicate in the initialize section
    def study_scenario(friend, friend_location)
        puts "Books start flying off the shelves from around the room, throwing themselves at you.\nYou need to act fast! Do you catch a book and start reading it, or do you throw yourself on the floor and try to crawl out?"
        puts "Enter 'catch' or 'crawl':"
        @@choice = gets.chomp.downcase
        if @@choice == "catch"
            puts "Bizarrely, you grab a book and try to read the first page.\nIn the meantime another book clocks you on the head and you black out.\nWhen you come to you look down and gaze at your transparent body - congratulations you died, and will have to haunt the house forever!"
            exit(0)
        elsif @@choice == "crawl"
            puts "You instinctively hit the floor, and manage to crawl your way out back to the corridor."
            if friend_location == 1
                win(friend)
            else
                not_found(friend)
                puts "You head back into the corridor."
                Corridor.new(friend, friend_location)
            end
        end
    end
end



#corridor portion

class Corridor
    def initialize(friend, friend_location)
        puts "You enter the corridor."
        corridor_scenario(friend, friend_location)
    end
    
    def corridor_scenario(friend, friend_location)
        puts "Dimly, you can make out a door on the left, a door on the right, and set of stairs leading down to a cellar. Where do you want to look for #{friend}?\nEnter 'left', 'right', or 'cellar':"
        @choice = gets.chomp.downcase
            if @choice == "left"
                Study.new(friend, friend_location)
            elsif @choice == "right"
                DiningRoom.new(friend, friend_location)
            elsif @choice == "cellar"
                Cellar.new(friend, friend_location)
            else
                puts "That wasn't an option. You fumble around in the darkness looking for other options. While you're not looking an evil spirit approaches you from behind, and before you know it...\nAfter a momentary flash of pain, you look down and see you have died and turned into a ghost."
                exit(0)
            end

    end
end




end
