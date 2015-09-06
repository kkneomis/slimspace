require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable
  
  belongs_to :desk, dependent: :destroy
  belongs_to :space, dependent: :destroy
end