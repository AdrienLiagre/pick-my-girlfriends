class Girlfriend < ActiveRecord::Base
  belongs_to :pimp, class_name: "User", foreign_key: 'pimp_id'
  has_attached_file :picture
end
