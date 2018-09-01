class SkillsController < ApplicationController
    def index #controlado por el GET
      #@rols = Skill.all
      @rol = Rol.find(params[:rol_id])
      @skills = @rol.skills
      render json: @skills, status: :ok
    end
    
    def getall #controlado por el GET
      @skills = Skill.all
      render json: @skills, status: :ok
    end

    def create #controlado por el POST
      #puts params
      #to_insert= {:description => params[:description], resource => params[:resource]} #paso los parametros
      #@skill = Skill.create(to_insert) #cree el skill con los parametros pasados
      #render json: @skill, status: :ok #render json nos devolveria el skill creado
      @skill = Skill.create(params.permit(:resource, :description)) #crear skill, el permit es como un filtro, sólo permite unos elementos para evitar hackeo
      @rol=Rol.find(params[:rol_id])
      @rol.skills << @skill #concatena a la lista de objetos que pertenecen a rol
      render json: @skill, status: :ok
    end

    def show
      @skill=Skill.find(params[:id])
      render json: @skill, status: :ok #render json nos devolveria el skill
    end
  end