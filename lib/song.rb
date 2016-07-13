class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  #creates a new instance of a song from the file that\'s passed in
  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end
  
# 'sets the artist object to belong to the song'
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
