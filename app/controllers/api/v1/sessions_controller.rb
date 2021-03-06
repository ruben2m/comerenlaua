class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_signed_out_user,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged in",
                      :data => { :user_token => current_user.authentication_token },
                      :shops => current_user.shops.as_json }
  end

  def destroy
    #warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    # No autenticamos para desconectar un cliente
    user = User.find_by_email(params[:user_email])
    user.update_column(:authentication_token, nil)
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end


  # curl -v -H 'Content-Type: v1/sessions -d "{\"user\":{\"email\":\"user@example.com\",\"password\":\"publicpass\"}}"
  # curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST http://0.0.0.0:3000/api/v1/sessions -d "{\"user\":{\"email\":\"esrumor@hotmail.com\",\"password\":\"publicpass\"}}"
  # curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X DELETE http://0.0.0.0:3000/api/v1/sessions\?user_token\=V8j-NsyJLn4uRidRKLw_\&user_email\=user\@example.com
end
