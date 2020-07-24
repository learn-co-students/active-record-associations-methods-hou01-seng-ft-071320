class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    Genre.find{|t| genre_id = self.id}.name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if an Drake is *not found*
    drake_row = Artist.find{|r| name = 'Drake'}
    if drake_row == nil
      drake_new_row = Artist.create(name: 'Drake')
      self.artist_id = drake_new_row.id
    else
      self.artist_id = drake_row.id
    end
  end
end