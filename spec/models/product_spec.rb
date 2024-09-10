require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.create(name: "Test Category") }
    
    it 'is valid with all fields present' do
      product = Product.new(name: "Test Product", price_cents: 1000, quantity: 10, category: category)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      product = Product.new(price_cents: 1000, quantity: 10, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      product = Product.new(name: "Test Product", quantity: 10, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
      expect(product.errors.full_messages).to include("Price is not a number")
    end

    it 'is not valid with a price less than or equal to 0' do
      product = Product.new(name: "Test Product", price_cents: 0, quantity: 10, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price must be greater than 0")
    end

    it 'is not valid without a quantity' do
      product = Product.new(name: "Test Product", price_cents: 1000, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      product = Product.new(name: "Test Product", price_cents: 1000, quantity: 10)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category must exist")
    end
  end
end
