class Review < ApplicationRecord
  belongs_to :movie
  validates :content, length: {minimum: 10}
end
