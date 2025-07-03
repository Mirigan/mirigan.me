class Admin::DashboardController < ApplicationController
  def index
    @posts = Post.order(:created_at).all
  end
end
