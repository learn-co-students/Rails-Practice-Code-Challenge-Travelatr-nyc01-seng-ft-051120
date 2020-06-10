class Post < ApplicationRecord
    belongs_to  :blogger
    belongs_to :destination
    # def increase_likes
    #     self.all.each do |post|
    #         post.likes += 1

    # end

end
