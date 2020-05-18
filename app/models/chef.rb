class Chef < User

	has_many :subscription
  has_one_attached :profile_image
    
  geocoded_by :city
  after_validation :geocode

  
  number_regex = /\d[0-9]\)*\z/
  geocoded_by :city
  after_validation :geocode, if: :address_changed?
  validates :first_name,presence: true,  format: { :with => /^[A-Za-z]*$/ , message: "can only contain letters" , :multiline => true}

  validates :last_name,presence: true,  format: { :with => /^[a-zA-Z]+$/ , message: "can only contain letters" , :multiline => true}
  validates :mobile_number,:presence => true,format: {:with => /^[^0-1][0-9]{9}$/ ,:multiline => true };
                 
  validates :email, presence: true ,format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :address, presence: true
  validates :city, presence: true
  validates :state,presence: true
  validates :country,presence: true
  validates :pincode,presence: true


  def unviewed_notifications_count
    Notification.for_chef(self.id)
  end

end
