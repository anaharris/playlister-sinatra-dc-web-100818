class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    if self.name.include?(" ")
      self.name.downcase.gsub!(/\s/, '-')
    else
      self.name.downcase
    end
  end

  def self.find_by_slug(slug)
    all.find {|song| song.slug == slug}
  end
end
