class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description
      t.integer :lecture_id
      t.string :reviewer
      t.string :person_being_reviewed

      t.timestamps null: false
    end
  end
end
