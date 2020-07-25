class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    Song.select{|t| genre_id = self.id}.count
  end

  def artist_count
    # return the number of artists associated with the genre
    Song.where("genre_id = #{self.id}").group(:artist).count.count
  end

  def all_artist_names
    Song.all.group(:artist_id)
    .map{|song| Artist.find_by(id: song.artist_id)}
    .map{|artist| artist.name}
  end
end
