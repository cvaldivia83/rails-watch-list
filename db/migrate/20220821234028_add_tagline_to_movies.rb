class AddTaglineToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :tagline, :string
  end
end
