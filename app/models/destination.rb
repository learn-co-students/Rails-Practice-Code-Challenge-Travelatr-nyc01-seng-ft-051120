class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts

  def most_recent_five_posts
   self.posts[1..5]
  end

  def top_post
    self.posts.max_by { |post| post.likes }
  end

 def bloggers_age_sum
  self.posts.map { |p| p.blogger.age }.sum
 end

  def bloggers_average_age
    self.bloggers_age_sum / self.bloggers.count
  end
end
