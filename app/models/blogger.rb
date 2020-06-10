class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes 
        total_likes = 0
        self.posts.each do |post|
            total_likes += post.likes
        end
        total_likes
    end

    def featured_post
        self.posts.max_by do |post|
            post.likes
        end
    end


end
