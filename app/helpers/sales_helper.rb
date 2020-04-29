module SalesHelper
  def active_sale?
    Sale.active.order(:percent_off).any?
    # return highest discount sale?
  end
end