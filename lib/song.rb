require_relative "artist.rb"

class Song

    attr_accessor :artist, :name
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end


    def self.all
        @@all
    end

    def self.new_by_filename(file)
        artiste, title = file.split(" - ")
        newest_song = self.new(title)#######################################################3
        newest_song.artist_name = artiste
        newest_song
    end




    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)####################################
        artist.add_song(self)####################################
    end



end