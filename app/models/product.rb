class Product < ApplicationRecord
    validates :category, presence: true
    validates :name, presence: true
    validates :weight, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :about_product, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ["about_product", "category", "created_at", "id", "id_value", "name", "price", "updated_at", "weight"]
      end
    
  end
  