class MainController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @shops = Shop.all
  end
end
