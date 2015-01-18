class AuthenticationsController < ApplicationController
  before_action :set_authentication, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # def index
  #   @authentications = Authentication.all
  #   respond_with(@authentications)
  # end

  # def show
  #   respond_with(@authentication)
  # end

  # def new
  #   @authentication = Authentication.new
  #   respond_with(@authentication)
  # end

  # def edit
  # end

  # def create
  #   @authentication = Authentication.new(authentication_params)
  #   @authentication.save
  #   respond_with(@authentication)
  # end

  # def update
  #   @authentication.update(authentication_params)
  #   respond_with(@authentication)
  # end

  # def destroy
  #   @authentication.destroy
  #   respond_with(@authentication)
  # end
def index
  @authentications = current_user.authentications if current_user
end

def create
  auth = request.env["rack.auth"]
  current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
  flash[:notice] = "Authentication successful."
  redirect_to authentications_url
end

def destroy
  @authentication = current_user.authentications.find(params[:id])
  @authentication.destroy
  flash[:notice] = "Successfully destroyed authentication."
  redirect_to authentications_url
end
  private
    def set_authentication
      @authentication = Authentication.find(params[:id])
    end

    def authentication_params
      params.require(:authentication).permit(:user_id, :provider, :uid)
    end
end
