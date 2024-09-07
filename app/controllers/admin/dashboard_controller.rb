class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin

  def show
    @total_products = Product.count
    @total_orders = Order.count
    @total_revenue = Order.sum(:total_cents) / 100.0
  end

  private

  def authenticate_admin
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end
end
