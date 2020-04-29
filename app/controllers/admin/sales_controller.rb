class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.all.order(:starts_on, :ends_on)
  end
end
