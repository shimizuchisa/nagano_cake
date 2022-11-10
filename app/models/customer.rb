class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :cart_items
  has_many :orders

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :email
    validates :encrypted_password
    validates :postal_code
    validates :address
    validates :telephone_number
  end

  def address_display
    "〒" + postal_code + ' ' + address
  end

end
