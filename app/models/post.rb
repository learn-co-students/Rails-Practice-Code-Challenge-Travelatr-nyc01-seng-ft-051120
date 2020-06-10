class Post < ApplicationRecord
   belongs_to :blogger
   belongs_to :destination

   def increase_likes
      self.likes += 1
   end

   # def add_like
   #    if something
   #       self.likes += 1
   #    end
   # end
end
