class ChangeCreationDateDatatypeFromMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :creation_date, :date
  end
end
