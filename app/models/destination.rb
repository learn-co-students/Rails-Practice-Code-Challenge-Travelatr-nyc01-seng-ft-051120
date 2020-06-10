class Destination < ApplicationRecord
   has_many :posts
   has_many :bloggers, through: :posts



   def recent_five
      self.posts.last(5)   
   end

   def top_post      
      self.posts.max do |a, b|
         a.likes <=> b.likes
      end
   end

   def combined_ages
      # self.bloggers.reduce(0) do |note, blogger|
      #    note + blogger.age
      #    note
      # end
      self.bloggers.map do |blogger|
         blogger.age
      end.sum
   end

   def ave_age
      self.combined_ages/self.bloggers.count
   end

end
