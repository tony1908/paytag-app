class DataController < ApplicationController
	protect_from_forgery with: :null_session
  
  # before_action :check_auth#, :except => [:nuevoUsuario]


  def check_auth
    authenticate_or_request_with_http_basic do |username,password|
      resource = User.find_by_email(username) 
      if resource != nil
        if resource.valid_password?(password)
        sign_in :user, resource
        $userIdenti = resource
        else
          render :json => {status: 0}
        end
      else
        render :json => {status: 2}
      end
      
      end
  end

  def newPhones
  	@user = User.find($userIdenti.id)
  	if @phones = @user.phones.create!(phones_param)
  		render :json => {:status => "ok", :numbers => @phones.as_json(:only => [:number, :id])}
  	else
  		respond_with @phones, status: :unprocessable_entity
  	end
  end

  def editPhone
    @phone = Phone.where("id = ? AND user_id = ?",params[:id],$userIdenti.id).first
    if @phone.update_attributes!(phone_param)
      render :json => {:status => "ok", :numbers => @phone.as_json(:only => [:number, :id])}
    else
      respond_with @phone, status: :unprocessable_entity
    end
  end

  def showDatos
    @user = User.find(1)
    render :json => {:status => "ok", :numbers => @user.phones.as_json(:only => [:number, :id]), :addresses => @user.addresses.as_json}
  end


  private

  def phones_param
  	params.permit(numbers:[:number]).require(:numbers)
  end
  def phone_param
    params.require(:phone).permit(:number)
  end

end
