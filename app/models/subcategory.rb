class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products

  validates :name, presence: true
  validates :category_id, presence: true



  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "id", "id_value", "name", "updated_at"]
  end


  def self.ransackable_associations(auth_object = nil)
    ["category", "products"]
  end

  
end
