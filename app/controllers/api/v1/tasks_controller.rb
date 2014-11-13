class Api::V1::TasksController < ApplicationController
  skip_before_filter :verify_authenticity_token,
    :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  #skip_before_filter :authenticate_user!

  respond_to :json

  def index
    directory = "public/data"
    path = File.join(directory, "prueba.jpg")
    File.open(path, "wb") { |f| f.write(params[:file]) }

    render :text => '{
  "success":true,
  "info":"ok",
  "data":{
    "tasks":[
      {"title":"Complete the app"},
      {"title":"Complete the tutorial"}
    ]
  }
}'
  end
end
