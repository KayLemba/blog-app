class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_post_comment_count

  def recent_comments
    comments.order('created_at Des').limit(5)
  end

  private

  def update_post_comment_count
    post.increment!(:comments_counter)
  end
end
