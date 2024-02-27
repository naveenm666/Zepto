require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    before(:each) do
      # Create a new Subcategory record
      subcategory = Subcategory.create(name: 'Valid Subcategory Name')
      
      # Use the id of the created Subcategory for subcategory_id in @valid_values
      @valid_values = {
        name: 'Valid Product Name',
        price: 10.99,
        subcategory_id: subcategory.id,
        weight: 500,
        about_product: 'Good Product Description'
      }
    end

    it 'should be invalid when price is blank' do
      product = Product.new(@valid_values.merge(price: nil))
      expect(product.valid?).to be_falsy
    end

    it 'should be invalid when subcategory_id is blank' do
      product = Product.new(@valid_values.merge(subcategory_id: nil))
      expect(product.valid?).to be_falsy
    end
  end
end


# it 'should be valid when we pass all valid values' do 
#   product = Product.new(@valid_values)
#   puts product.inspect
#   puts product.errors.full_messages unless product.valid?
#   expect(product.valid?).to be_truthy
# end
