require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @category = Category.create!(id: 1, name: 'Test Category')
      @product1 =
        Product.create!(
          id: 1,
          name: 'New Product 1',
          price_cents: 1000,
          quantity: 10,
          category: @category
        )
      @product2 =
        Product.create!(
          id: 2,
          name: 'New Product 2',
          price_cents: 1000,
          quantity: 10,
          category: @category
        )
      @product3 =
        Product.create!(
          id: 3,
          name: 'New Product 3',
          price_cents: 1000,
          quantity: 10,
          category: @category
        )
    end

    it 'deducts quantity from products based on their line item quantities' do
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(total_cents: 1000, stripe_charge_id: 1)

      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: @product1.price_cents,
        total_price: @product1.price_cents * 2
      )
      @order.line_items.new(
        product: @product2,
        quantity: 4,
        item_price: @product2.price_cents,
        total_price: @product2.price_cents * 4
      )

      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!

      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload

      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(8)
      expect(@product2.quantity).to eq(6)
    end

    it 'does not deduct quantity from products that are not in the order' do
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(total_cents: 1000, stripe_charge_id: 1)

      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: @product1.price_cents,
        total_price: @product1.price_cents * 2
      )
      @order.line_items.new(
        product: @product2,
        quantity: 4,
        item_price: @product2.price_cents,
        total_price: @product2.price_cents * 4
      )

      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!

      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      @product3.reload

      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(8)
      expect(@product2.quantity).to eq(6)
      expect(@product3.quantity).to eq(10)
    end
  end
end
