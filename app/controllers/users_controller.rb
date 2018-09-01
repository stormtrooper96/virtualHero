# app/controllers/users_controller.rb
class UsersController < ApplicationController
    # skip_before_action :authorize_request, only: :create
    # POST /signup
    # return authenticated token upon signup
  def index #controlado por el GET
      @users = User.all
      render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    json_response({"user": @user,"rol": @user.rol}) #objeto dentro de objeto, @user.rol nos permite mostrar la relación con rol
  end
  
  def create
    #si declaro con @ la variable está presente en toda la clase
    @rol=Rol.find(params[:rol])
    @user = User.create(user_params) #crear user, el permit es como un filtro, sólo permite unos elementos para evitar hackeo
    auth_token = AuthenticateUser.new(@user.email, @user.password).call
    @rol.users << @user #concatena a la lista de objetos que pertenecen a rol
    response = { message: Message.account_created, auth_token: auth_token } #creacion de objeto con atributo message con un metodo propio account create y un token
    #render json: @user, status: :ok
    json_response(response, :created)  
  end
  
  private
  
  def user_params
    new_params=params.permit(
      :rol,
      :nickname,
      :email,
      :avatar,
      :state,
      :registrationdate,
      :password,
      :password_confirmation
    )
    new_params[:rol]=@rol
      return new_params
  end
  
end