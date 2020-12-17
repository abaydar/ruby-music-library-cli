class Song
    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        new_song = self.new(name)
        new_song.save
        new_song
    end

    def self.find_by_name(name)
        self.all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

    def self.new_from_filename(filename)
        song_name = filename.split(" - ")[1]
        artist_name = filename.split(" - ")[0]
        genre_name = filename.split(" - ")[2].split(".")[0]

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        self.new(song_name, artist, genre)

        # song = Song.create(filename.split(" - ")[1])
        # song.artist = Artist.create(filename.split(" - ")[0])
        # song.genre = Genre.create(filename.split(" - ")[2].split(".")[0])
        # song
    end

    def self.create_from_filename(filename)
        song = new_from_filename(filename)
        song.save
        song
    end




end




























# class Song
#     attr_accessor :name
#     attr_reader :artist, :genre

#     @@all = []

#     def initialize(name, artist=nil, genre=nil)
#         @name = name
#         self.artist = artist if artist 
#         self.genre = genre if genre 
#         save
#     end

#     def self.all
#         @@all
#     end

#     def save
#         @@all << self
#     end

#     def self.destroy_all
#         @@all.clear
#     end

#     def self.create(song)
#         new_song = self.new(song)
#         new_song.save
#         new_song
#     end

#     def artist=(artist)
#         @artist = artist
#         artist.add_song(self)
#     end

#     def genre=(genre)
#         @genre = genre
#     end

#     def self.find_by_name(name)
#         self.all.find{|song| song.name == name}
#     end

#     def self.find_or_create_by_name(name)
#         self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
#     end    

# end