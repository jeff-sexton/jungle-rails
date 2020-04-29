class Admin::DashboardController < ApplicationController
  user = ENV['ADMIN_USER']
  pass = ENV['ADMIN_PASS']
  http_basic_authenticate_with name: user, password: pass
  def show
  end
end
