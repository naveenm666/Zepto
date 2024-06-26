# The User class is responsible for user data model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart
  has_many :addresses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.ransackable_attributes(auth_object = nil)
   ["created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end    
end
