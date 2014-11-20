class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :semester
      t.integer :year
      t.string :display_name

      t.timestamps null: false
    end
  end
end
