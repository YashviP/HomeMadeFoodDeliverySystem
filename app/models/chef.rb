class Chef < User
	has_many :subscription

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

 
end
