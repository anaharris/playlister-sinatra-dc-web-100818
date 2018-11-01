
  class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

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
