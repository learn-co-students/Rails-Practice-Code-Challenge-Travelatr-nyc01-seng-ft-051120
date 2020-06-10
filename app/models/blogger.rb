class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: :true
  validates :age, numericality: {greater_than: 0}
  validates :bio, length: {minimum: 30}

  def my_posts
    posts = []
    Post.all.each do |post|
      if post.blogger == self
        posts << post
      end
    end
    posts
  end

  def total_likes 
    counter = 0
    self.my_posts.each do |post|
      counter += post.likes
    end
  counter
  end

  def most_likes
    self.my_posts.max_by do |post|
      post.likes
    end
  end

end
