class Admin::DashboardController < Admin::BaseController
  def show
    @product_count = Product.count
    @category_count = Category.count
    @order_count = Order.count
    @order_revenue = Order.sum(:total_cents)
    @user_count = User.count
    @sale_count = Sale.count
  end
end
