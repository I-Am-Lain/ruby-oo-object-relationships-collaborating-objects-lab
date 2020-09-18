require_relative "song.rb"

class Artist

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select do |each_song|
            each_song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name }
    end

    def print_songs
        Song.all.collect do |s|
            if s.artist == self
                puts s.name
            end
        end

    end

end
