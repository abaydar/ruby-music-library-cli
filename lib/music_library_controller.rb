class MusicLibraryController

    def initialize(path = './db/mp3s')
        @path = path
        MusicImporter.new(path).import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        input = gets.strip
        call if input != "exit"

        case input
        when "list songs"
            list_songs
        when "list artists"
            list_artists
        when "list genres"
            list_genres
        when "list artist"
            list_songs_by_artist
        when "list genre"
            list_songs_by_genre
        when "play song"
            play_song
        end

    end

    def list_songs
        songs = Song.all.sort_by{|song| song.name}
        #songs = Song.all.sort{|a, b| a.name <=> b.name}
        #binding.pry
        songs.each.with_index(1){|song, i| puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}       
    end

    def list_artists
        artists = Artist.all.sort_by{|artist| artist.name}
        artists.each.with_index(1){|artist, i| puts "#{i}. #{artist.name}"}
    end

    def list_genres
        genres = Genre.all.sort_by{|genre| genre.name}
        genres.each.with_index(1){|genre, i| puts "#{i}. #{genre.name}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        songs_by_artist = Song.all.sort_by{|song| song.name}.select{|song| song.artist.name == input}
        songs_by_artist.each.with_index(1){|song, i| puts "#{i}. #{song.name} - #{song.genre.name}"}      
        #binding.pry
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        songs_by_genre = Song.all.sort_by{|song| song.name}.select{|song| song.genre.name == input}
        songs_by_genre.each.with_index(1){|song, i| puts "#{i}. #{song.artist.name} - #{song.name}"}
    end

    # def play_song
    #     puts "Which song number would you like to play?"
    #     list_songs
    #     input = gets.strip.to_i 


    #     #if input <= (Song.all.count) && input >= 0
    #     if input.between?(1, Song.all.count)
    #         song = Song.all.sort_by{|song| song.name}[input -1]   
    #         binding.pry     
    #     end

    #     puts "Playing song #{song.name} by #{song.artist.name}"
    #   # binding.pry
    # end

    def play_song
        puts "Which song number would you like to play?"
    
        input = gets.strip.to_i
        if (1..Song.all.length).include?(input)
          song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
        end
    
        puts "Playing #{song.name} by #{song.artist.name}" if song
      end



end