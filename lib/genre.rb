class Genre
    attr_accessor :name
    attr_reader :songs
    extend Concerns::Findable
    @@all = []
   
    def initialize(name)
        @name = name
        @songs = []
        @@all << self 
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

    def self.create(genre)
        genre = self.new(genre)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def artists
        songs.map(&:artist).uniq
    end
end