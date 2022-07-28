class Review < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :customer
    
    #Return a string Review for {insert restaurant name} by {insert customer's full name}: {insert review star_rating} stars.
    def full_review
        "Review for #{restaurant.name} by #{customer.full_name}: #{star_rating} stars."
    end
end