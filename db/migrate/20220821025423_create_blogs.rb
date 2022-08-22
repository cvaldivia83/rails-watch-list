class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :post
      t.string :author
      t.date :date

      t.timestamps
    end
  end
end
