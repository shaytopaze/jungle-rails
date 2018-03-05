require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :example do
      @category = Category.create(name:'test')
      @product = @category.products.create(name: 'name', price_cents: 10, quantity: 1)
    end
    it "creates a product with a name, price, quantity and category" do
      expect(@product.valid?).to eq true
    end
    it "throws error if name is missing" do
      @product.name = nil
      expect(@product.valid?).to eq false
    end
    it "throws error if price is missing" do
      @product.price_cents = nil
      expect(@product.valid?).to eq false
    end
    it "throws error if price is missing" do
      @product.quantity = nil
      expect(@product.valid?).to eq false
    end
    it "throws error if price is missing" do
      @product.category = nil
      expect(@product.valid?).to eq false
    end
  end
end



