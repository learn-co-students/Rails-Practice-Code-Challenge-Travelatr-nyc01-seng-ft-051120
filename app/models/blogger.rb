class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations , through: :post 
    validates :name , uniqueness: true
    # validates :age, numerically: {greater_than:0}

    def post_with_most_likes
      self.posts.max{|x1,x2| x1.likes <=> x2.likes}
    end

    def total_likes
      self.posts.reduce(0){|sum,val| sum+val.likes}
    end

    # def destination_with_most_post
    #   self.
    # end
end
