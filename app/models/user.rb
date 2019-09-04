class User < ApplicationRecord
  after_create :set_cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :cart

    def set_cart
    @cart = Cart.find_by(user_id: self.id)
    if @cart == nil
      @cart = Cart.new
      @cart.user_id = self.id
      @cart.save
    end
  end


end
