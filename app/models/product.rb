class Product < ApplicationRecord
    belongs_to :subcategory
    has_many :cart_products
    has_many :carts, through: :cart_products

    validates :name, presence: true
    validates :weight, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :about_product, presence: true
    validates :subcategory_id, presence: true
   
    enum :product_weight, [:kg, :grams, :liters, :ml]

    def self.ransackable_attributes(auth_object = nil)
        ["about_product", "created_at", "id", "id_value", "name", "price", "updated_at", "weight","product_weight","country_of_origin", "shelf_life", "manufacturer_name", "manufacturer_address"]
      end

    def self.ransackable_associations(auth_object = nil)
        super + ["category"]
    end
        
    
  end
  