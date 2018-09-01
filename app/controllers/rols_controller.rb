class RolsController < ApplicationController
    def index
      @rols = Rol.all
      render json: @rols, status: :ok
    end
    
    def create
      #puts params
      to_insert= {:description => params[:description]} #paso los parametros
      @rol = Rol.create(to_insert) #cree el rol con los parametros pasados
      render json: @rol, status: :ok #render json nos devolveria el rol creado
    end

    def show
      @rol = Rol.find(params[:id]) #cree el rol con los parametros pasados
      render json: @rol, status: :ok #render json nos devolveria el rol creado
    end
end