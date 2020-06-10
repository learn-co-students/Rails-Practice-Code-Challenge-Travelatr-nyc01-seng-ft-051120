class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts
validates :name, uniqueness: true
validates :age, numericality: {:greater_than => 0 }
validates :bio, length: { minimum: 30 }



def set_blogger
    @blogger=Blogger.find(params[:id])
end

def counter
    counter=0
    self.posts.each do |p|
        counter +=p.likes
    end
    counter
end

def featured_post
    featured_post=nil
    counter=0
    self.posts.each do |p|
        if p.likes>counter
            counter=p.likes
            featured_post=p
        end
    end
    featured_post
end
end
