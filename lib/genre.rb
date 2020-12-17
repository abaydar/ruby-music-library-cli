class Genre
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
        new_genre = self.new(name)
        new_genre.save
        new_genre
    end

    def artists
        songs.map{|song| song.artist}.uniq
    end

end










# class Genre
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

#     def self.create(genre)
#         new_genre = self.new(genre)
#         new_genre.save
#         new_genre
#     end

#     def songs 
#         Song.all.select{|song| song.genre = self}
#     end

#     def artists
#         songs.map{|song| song.artist}.uniq
#     end

# end