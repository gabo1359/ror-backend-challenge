class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.datetime :creation_date
      t.integer :rating
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
