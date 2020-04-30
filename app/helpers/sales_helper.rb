module SalesHelper
  def active_sale
    Sale.highest_active
    # return highest discount sale?
  end
end