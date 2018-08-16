class GenreDownloader
  attr_accessor :artist, :genres

  def self.perform(artist, genres)
    new(artist, genres).perform
  end

  def initialize(artist, genres)
    @artist = artist
    @genres = genres
  end

  def perform
    return if genres.nil?

    genres.each do |genre|
      local_genre = Genre.find_by(name: genre)

      if local_genre.nil?
        local_genre = Genre.create!(name: genre)
      end

      ArtistGenre.create!(artist_id: artist.id, genre_id: local_genre.id)
    end
  end
end