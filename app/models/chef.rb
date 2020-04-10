class Chef < User

	has_many :subscription
    
  geocoded_by :city
  after_validation :geocode

  def full_address
    [city,state].compact.join(',')
  end
    

  number_regex = /\d[0-9]\)*\z/
  geocoded_by :city
  after_validation :geocode, if: :address_changed?
  validates :first_name,presence: true,  format: { :with => /^[A-Za-z]*$/ , message: "can only contain letters" , :multiline => true}

  validates :last_name,presence: true,  format: { :with => /^[a-zA-Z]+$/ , message: "can only contain letters" , :multiline => true}
  validates :mobile_number,:presence => true,format: {:with => /^[^0-1][0-9]{9}$/ ,:multiline => true };
                 
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }

end
