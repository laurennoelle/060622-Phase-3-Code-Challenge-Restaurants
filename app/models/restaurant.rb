class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    #returns one restaurant instance for the restaurant that has the highest price
    def self.fanciest
        self.all.order(:price).last
    end

    #should return an Array of strings with all the reviews for this restaurant formatted as follows
    def all_reviews
        self.reviews.map do |review|
            review.full_review
        end
    end
end