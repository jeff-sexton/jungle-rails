module SalesHelper
  def active_sale
    Sale.active.order(percent_off: :desc).first
    # return highest discount sale?
  end
end