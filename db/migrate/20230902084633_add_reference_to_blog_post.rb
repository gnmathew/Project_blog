class AddReferenceToBlogPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :blog_posts, :user
  end
end
