class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.references :user
      t.string :name, null: false, default: ''
      t.string :genre
      t.integer :year
      t.string :director
      t.text :description

      t.timestamps null: false
    end

    add_index :movies, :user_id
  end
end
