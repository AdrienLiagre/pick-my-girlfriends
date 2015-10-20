class Appointment < ActiveRecord::Base
  has_one :review

  belongs_to :client, class_name: "User", foreign_key: 'client_id'
  belongs_to :girlfriend
end
