class Blogger < ApplicationRecord
   has_many :posts
   has_many :destinations, through: :posts
   validates :name, uniqueness: true
   validates :age, numericality: {greater_than: 0}
   validates :bio, length: {minimum: 100}


   def likes
      self.posts.reduce(0){ |sum, post| sum + post.likes }
   end

   def top_post      
      self.posts.max do |a, b|
         a.likes <=> b.likes
      end
   end

end
