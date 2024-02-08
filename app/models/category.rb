# The Category class is responsible for product category
class Category < ApplicationRecord
    has_many :subcategories
    has_many :products, through: :subcategories

    validates :name, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "id_value", "name", "updated_at"]
      end
    
    def self.ransackable_associations(auth_object = nil)
       super + ["products"]
    end  
    
end
