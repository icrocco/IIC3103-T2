class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuario
  def index
    json_response(Usuario.with_count)
  end

  # PUT /usuario
  def create
    if params[:id] != nil
      json_response({ error: "No se puede crear usuario con id" }, :bad_request)
    else
      @usuario = User.new
      @usuario.nombre = params[:nombre]
      @usuario.apellido = params[:apellido]
      @usuario.usuario = params[:usuario]
      @usuario.twitter = params[:twitter]
      if @usuario.save
        json_response(@usuario)
      else
        json_response({ error: "La creación ha fallado" }, :internal_server_error)
      end
      #@usuario = Usuario.create!(usuario_params)
      #json_response({id: @usuario.id, nombre: @usuario.nombre, apellido: @usuario.apellido, usuario: @usuario.usuario, twitter: @usuario.twitter}, :created)
    end
  end

  # GET /usuarios/:id
  def show
    json_response({id: @usuario.id, nombre: @usuario.nombre, apellido: @usuario.apellido, usuario: @usuario.usuario, twitter: @usuario.twitter})
  end

  # POST /usuario/:id
  def update
    if params[:usuario] == nil && params[:nombre] == nil && params[:apellido] == nil && params[:twitter] == nil
      json_response({ error: "id no es modificable" }, :bad_request)
    else
      if @usuario.update(usuario_params)
        json_response(@usuario)
      else
        json_response({ error: "La modificación ha fallado" }, :internal_server_error)
      end
    end
  end

  # DELETE /usuario/:id
  def destroy
    @usuario.destroy
    head :no_content
  end

  private

  def usuario_params
    # whitelist params
    params.permit(:usuario, :nombre, :apellido, :twitter)
  end

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end
end
