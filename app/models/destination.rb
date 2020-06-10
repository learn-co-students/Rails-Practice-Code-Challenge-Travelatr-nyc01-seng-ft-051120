class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def last_five
        self.posts.last(5)
    end

    def featured_post
        self.posts.max_by do |post|
            post.likes
        end
    end

    def average_age
        total_age = 0
        blogger_unique = self.bloggers.uniq
        blogger_unique.each do |blogger|
            total_age += blogger.age
        end
        total_age / self.bloggers.count
    end


end
