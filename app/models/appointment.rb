class Appointment < ActiveRecord::Base
  has_one :review
end
