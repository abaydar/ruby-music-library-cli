class Artist
    attr_accessor :name
    attr_reader :songs
    extend Concerns::Findable

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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
        new_artist = self.new(name)
        new_artist.save
        new_artist
    end

    # def songs
    #     @songs
    # end

    def add_song(song)
        song.artist = self unless song.artist
        songs << song unless songs.include?(song)
    end

    def genres
        songs.map{|song| song.genre}.uniq
    end

end




























# class Artist
#     attr_accessor :name
#     attr_reader :songs

#     @@all = []

#     def initialize(name)
#         @name = name
#         @songs = []
#     end

#     def save
#         @@all << self
#     end

#     def self.all
#         @@all
#     end

#     def self.destroy_all
#         @@all.clear
#     end

#     def self.create(artist)
#         new_artist = self.new(artist)
#         new_artist.save
#         new_artist
#     end

#     def songs
#         Song.all.select{|song| song.artist = self} #why = and not == ??
#     end

#     def add_song(song)
#         song.artist = self unless song.artist
#     end

#     def genres
#         songs.map{|song| song.genre}.uniq
#     end



# end