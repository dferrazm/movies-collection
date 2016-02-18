class AddPictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :movie
      t.string :image
    end

    add_index :pictures, :movie_id
  end
end
