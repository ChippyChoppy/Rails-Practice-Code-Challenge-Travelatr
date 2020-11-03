class Blogger < ApplicationRecord
    has_many :posts 
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0 }
    validates :bio, length: {minimum: 30 }

    def total_likes
        self.posts.sum {|post| post.likes}
    end

    def featured_post
        self.posts.max_by{|post| post.likes }       
    end

    def destinations
        self.posts.map {|post| post.destination}
    end

    def top_five_destinations
        self.destinations.max_by(5) {|destination| destination}.uniq
    end

end
