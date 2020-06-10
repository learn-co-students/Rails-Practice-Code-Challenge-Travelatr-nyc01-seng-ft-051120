class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts


  def my_posts
    posts = []
    Post.all.each do |post|
      if post.destination == self
      posts << post
      end
    end
    posts
  end

  def last_posts
    self.my_posts.last(5)
  end

  def most_liked
    self.my_posts.max_by do |post|
      post.likes
    end
  end

  def my_bloggers
    self.my_posts.map do |post|
      post.blogger
    end.uniq
  end

  def bloggers_age
    self.my_bloggers.map do |blogger|
      blogger.age 
    end
  end

  def average_blogger_age
    total = " "
   total = self.bloggers_age.sum
   total/self.bloggers_age.count
  end

end
