class Api::V1::TasksController < ApplicationController
  skip_before_filter :verify_authenticity_token,
    :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  #skip_before_filter :authenticate_user!

  respond_to :json

  def index
    directory = "public/menus"
    if (current_user.shops.find(params[:shop]))
      path = File.join(directory, "prueba.jpg")
      File.open(path, "wb") { |f| f.write(params[:file]) }
    end

    render :text => '{
  "success":true,
  "info":"ok",
}'
  end
end
