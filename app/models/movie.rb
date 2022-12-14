class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :reviews, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  include PgSearch::Model
  pg_search_scope :search_movies, against: {
    title: 'A',
    overview: 'B',
    tagline: 'C'
  },
  using: {
    tsearch: { prefix: true }
  }
end
