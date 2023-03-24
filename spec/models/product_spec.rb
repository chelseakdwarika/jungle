require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
#initial eg with all four fields set
    it 'should have name, price, quantity and category' do
      @category = Category.new(name: 'Dangerous Plants')
      @product = @category.products.build(name: 'Venus Fly Trap', price: 5555, quantity: 55)
      @product.save
      expect(@product.errors.full_messages.size).to eq(0)
    end

    it 'should have a name' do
      @category = Category.new(name: 'Dangerous Plants')
      @product = @category.products.build(name: 'Venus Fly Trap')
      @product.save
      expect(@product.errors[:name].size).to eq(0)
    end

    it 'should have a price' do
      @category = Category.new(name: 'Dangerous Plants')
      @product = @category.products.build(price: 5555)
      @product.save
      expect(@product.errors[:price].size).to eq(0)
    end

    it 'should have a quantity' do
      @category = Category.new(name: 'Dangerous Plants')
      @product = @category.products.build(quantity: 55)
      @product.save
      expect(@product.errors[:quantity].size).to eq(0)
    end

    it 'should have a category' do
      @product = Product.create(name: 'Venus Fly Trap', price: 5000, quantity: 55)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end