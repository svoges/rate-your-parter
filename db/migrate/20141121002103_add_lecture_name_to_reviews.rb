class AddLectureNameToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :lecture_name, :string
  end
end
