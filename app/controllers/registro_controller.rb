class RegistroController < ApplicationController
	protect_from_forgery with: :null_session
  
  before_action :check_auth, :except => [:nuevoUsuario]
  

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
 
  	def nuevoUsuario
  		@user = User.new user_params
      if @user.save!
        render json: {status:"ok"}
      else
        respond_with @user, status: :unprocessable_entity 
      end
  	end

    def suspenderUsuario
      @user = User.find($userIdenti.id)
      if @user.update_attributes(:status => @user.checkStatus())
        render json: {status:"ok"}
      else
        respond_with @user, status: :unprocessable_entity 
      end
    end

    def upgradeCuenta
      @user = User.find($userIdenti.id)
      if params[:AccountNumber].present? and @user.cuser_id == nil
        @cuser = @user.build_cuser(:defaultAccount => '')
        @account = @cuser.bankAccounts.build(bank_account_params)
        begin
          if @cuser.save! and @account.save!
            @user.update_attributes(:cuser_id => @cuser.id)
            render json: {status:"0k"}
          else
            respond_with @cuser, @account, status: :unprocessable_entity
          end
        rescue Exception => e
          puts e
          render json: {status:"error"}
        end
      else
        render json: {status:"no pasa"}
      end
    end

    protected
    def user_params
      params.require(:user).permit(:email, :password, :name)
    end
    def bank_account_params
      params.permit(:AccountNumber, :bank, :clabe, :name)
    end
end
