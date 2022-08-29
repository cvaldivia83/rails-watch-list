class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  include PgSearch::Model
  pg_search_scope :search_movies, against: {
    title: 'A',
    overview: 'B',
    tagline: 'F'
  },
  using: {
    tsearch: { prefix: true }
  }
end
