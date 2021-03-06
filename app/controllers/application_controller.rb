class ApplicationController < ActionController::Base # For APIs, you may want to use :null_session instead. # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  private

  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def enhanced_cart
    @enhanced_cart ||=
      Product.where(id: cart.keys).map do |product|
        { product: product, quantity: cart[product.id.to_s] }
      end
  end
  helper_method :enhanced_cart

  def cart_subtotal_cents
    active_sale = Sale.highest_active
    discount = (active_sale && 1 - active_sale.percent_off / 100.00) || 1

    enhanced_cart.map do |entry|
      entry[:product].price_cents * discount * entry[:quantity]
    end.sum.to_i
  end
  helper_method :cart_subtotal_cents

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart), expires: 10.days.from_now
    }
    cookies[:cart]
  end
end
