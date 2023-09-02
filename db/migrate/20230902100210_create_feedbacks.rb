class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :comment
      t.references :user
      t.references :blog_post

      t.timestamps
    end
  end
end
