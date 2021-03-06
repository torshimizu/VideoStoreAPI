class Movie < ApplicationRecord
  validates :title, presence: true
  validates :inventory, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, on: :create

  validate :uniq_title_release_date_combo, on: :create

  has_many :rentals

  def uniq_title_release_date_combo
    movies = Movie.where(title: title)

    if movies.any?{ |movie| movie.release_date == release_date }
      errors[:release_date] << 'Cannot have a movie with the same title and release date'
    end
  end
end
