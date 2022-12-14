class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items
  has_many :order_items

  with_options presence: true do
    validates :genre_id
    validates :name
    validates :introduction
    validates :price
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_icon.jpeg')
      image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
