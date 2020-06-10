class Post < ApplicationRecord
    belongs_to  :blogger
    belongs_to :destination
   
    def increase_likes
        self.likes += 1 

    end

end
