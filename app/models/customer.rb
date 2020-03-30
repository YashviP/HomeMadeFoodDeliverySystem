class Customer < User

	geocoded_by :full_address
    after_validation :geocode

    def full_address
      [address,city,pincode].compact.join(',')
    end


end
