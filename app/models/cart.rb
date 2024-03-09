class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products

  def self.ransackable_associations(auth_object = nil)
    ["cart_products", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "updated_at", "user_id"]
  end
end
