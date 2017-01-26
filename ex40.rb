class Song

    def initialize(lyrics)
        @lyrics = lyrics
    end

    def sing_me_a_song()
        @lyrics.each {|line| puts line}
    end

end

happy_bday = Song.new(["Happy birthday to you", "I don't want to get sued", "So I'll stop right there"])

bulls_on_parade = Song.new(["They rally round tha family", "With pockets full of shells"])

jump = ["I get up", "And nothing gets me down", "You say you got it tough", "I've seen the toughest aaaaaround"]


happy_bday.sing_me_a_song()

bulls_on_parade.sing_me_a_song()

jump_song = Song.new(jump)

jump_song.sing_me_a_song()

