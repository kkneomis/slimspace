require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable
  
  belongs_to :space
  belongs_to :tenant, class_name: "User"
  belongs_to :landlord, class_name: "User"

end