class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers , through: :posts 

  def post_with_most_likes
    self.posts.max{|x1,x2| x1.likes <=> x2.likes}
  end

  def last_five_post
    self.posts.last(5)
  end
  
  def average_age_of_bloggers 
    self.unique_bloggers.reduce(0){|sum,blogger| sum + blogger.age}/self.unique_bloggers.count
  end

  def unique_bloggers
    self.bloggers.uniq
  end

end
