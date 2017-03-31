class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuario
  def index
    @usuarios = Usuario.all
    json_response(@usuarios)
  end

  # PUT /usuario
  def create
    @usuario = Usuario.create!(usuario_params)
    json_response(@usuario, :created)
  end

  # GET /usuarios/:id
  def show
    json_response(@usuario)
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
