#encoding: utf-8

class MainController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @shops = Shop.all
  end

  def get_mobile_data
    respond_to do |format|
      format.json { render json: "Accedido a parte pública" }
    end
  end
end
