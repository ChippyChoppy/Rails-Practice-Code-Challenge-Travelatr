class Blogger < ApplicationRecord
    has_many :posts 
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, :numericality => {greater_than: 0 }
    validates :bio, length: {minimum: 30 }

    def featured_post
        sorted = self.posts.sort_by{|post| post.likes }
        sorted.first
    end


end
