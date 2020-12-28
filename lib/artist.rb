class Artist
    attr_accessor :name
    attr_reader :song  
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

    def self.create(artist)
        artist = self.new(artist)
        artist.save
        artist
    end

    def songs
        @songs
    end

    def add_song(song)
        song.artist = self unless song.artist
        songs.push song unless songs.include?(song)
    end

    def genres
        songs.map(&:genre).uniq
    end


end