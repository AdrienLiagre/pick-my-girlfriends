class Girlfriend < ActiveRecord::Base
  belongs_to :pimp, class_name: "User", foreign_key: 'pimp_id'
  has_many :appointments

  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def full_address
    return "#{street}, #{postcode}, #{city}, France"
  end

  def full_address_changed?
    street_changed? || postcode_changed?  || city_changed?
  end
end
