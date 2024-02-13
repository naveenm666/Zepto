class Product < ApplicationRecord
    belongs_to :subcategory

    validates :name, presence: true
    validates :weight, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :about_product, presence: true
    validates :subcategory_id, presence: true
   
    enum :product_weight, [:kg, :grams, :liters, :ml]

    def self.ransackable_attributes(auth_object = nil)
        ["about_product", "created_at", "id", "id_value", "name", "price", "updated_at", "weight","product_weight"]
      end

    def self.ransackable_associations(auth_object = nil)
        super + ["category"]
    end
        
    
  end
  