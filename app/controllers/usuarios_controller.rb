class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  # GET /usuarios
  # GET /usuarios.json
  def index
	@acesso=acesso(nil)
	@usuarios = Usuario.all.page(params['page']).per(10)
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
	@acesso=acesso(nil)
  end

  # GET /usuarios/new
  def new
	@acesso=acesso(nil)
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
	@acesso=acesso(nil)
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
	@acesso=acesso(nil)
	@usuario = Usuario.new(usuario_params)
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end
    
  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
	@acesso=acesso(nil)
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end
    
  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
	@acesso=acesso(nil)
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nome, :login, :senha,:senha_confirmation, :email,:foto)
    end
end