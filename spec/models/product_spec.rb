require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.new(:name => "Pets") }
    let(:product) { category.products.new(name: 'Dog Sultan Bed', price: 129.99, quantity: 20) }

    it 'is saved succesfully with all valid fields' do
      expect(product).to be_valid
    end

    it 'should not save if name is not valid' do
      product.name = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Name can\'t be blank')
    end

    it 'should not save if price is not valid' do
      product.price_cents = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Price can\'t be blank')
    end

    it 'should not save if quantity is not valid' do
      product.quantity = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Quantity can\'t be blank')
    end

    it 'should not save if category is not valid' do
      product.category = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Category can\'t be blank')
    end
  end
 
end

