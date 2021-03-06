class Listing < ApplicationRecord
    belongs_to :user
# http://www.ryanmcmahon.org/articles/11
    include PgSearch::Model
  pg_search_scope :search_by_listings, :against => [:name, :address, :postal_code, :email, :description],
    using: {
      :tsearch => {:prefix => true}
    }

    has_many :reviews
    
    # https://www.youtube.com/watch?v=SvcDjGEgCc4
    scope :between_range, -> (min, max) { where("price >= ? AND price <= ?", min, max) }
end