class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  # after_create :update_product_inventory

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  private

  def update_product_inventory
    self.line_items.each do |item|
      product = Product.find(item[:product_id])
      product.quantity -= item.quantity
      product.save
    end
  end
end
