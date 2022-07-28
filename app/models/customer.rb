class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews

    #returns the full name of the customer, with the first name and the last name concatenated, Western style.
    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    #returns the restaurant instance that has the highest star rating from this customer
    #use a query method (.maximum)
    def favorite_restaurant
        self.maximum(:star_rating)
        #self.all.order(:star_rating).last
    end

    #creates a new review for the restaurant with the given restaurant_id
    def add_review(restaurant, rating)
        Review.create(restaurant: restaurant, star_rating: rating, restaurant_id: self)
    end

    #removes all their reviews for this restaurant
    #you will have to delete rows from the reviews table to get this to work!
    def delete_reviews(restaurant)
        reviews = Reviews.find_by(reviews:)
        reviews.destroy_all
        #Review.find_by(restaurant_id: restaurant.id, customer_id: self.id).destroy_all
    end
end