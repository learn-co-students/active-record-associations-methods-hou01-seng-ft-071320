require 'pry'

class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    Song.where("genre_id" == self.id).count
  end

  def artist_count
    self.artists.count
  end

  def all_artist_names
    self.artists.map {|a| a.name}
  end
end
