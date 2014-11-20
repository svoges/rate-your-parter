class AddPersonReviewedIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :person_reviewed_id, :integer
  end
end
