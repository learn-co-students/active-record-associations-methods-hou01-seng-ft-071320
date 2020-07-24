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
    # return an array of strings containing every musician's name
    artist_name = []
      Song.all.group(:artist_id).map do |song| song.artist_id
        Artist.all.each do |artist|
          if artist.id == song.artist_id
            artist_name << artist.name
          end
        end
      end
      artist_name
  end
end
