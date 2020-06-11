class Blogger < ApplicationRecord
 has_many :posts
 has_many :destinations, through: :posts

 validates :name, uniqueness: true
 validates :age, numericality: { greater_than: 0 }
 validates :bio, length: { minimum: 30}

 def likes
   self.posts.map { |p| p.likes }.sum
 end

 def featured_post
   self.posts.max_by { |post| post.likes }
 end

 def top_five_destinations
   self.posts.map { |p| p.destination }.max_by(5) { |d| d.posts.count}
 end
end
