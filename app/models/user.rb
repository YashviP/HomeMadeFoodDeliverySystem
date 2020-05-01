class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :subscription , dependent: :destroy
  has_one_attached :profile_image


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

end
