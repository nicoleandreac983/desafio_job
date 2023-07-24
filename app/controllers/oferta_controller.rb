class OfertaController < ApplicationController
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:edit, :update, :destroy]

  def check_admin_role
    unless current_usuario.admin?
      flash[:alert] = "Acceso no autorizado."
      redirect_to root_path
    end
  end
  

  def postularse
    @ofertum = Ofertum.find(params[:id])
    @postulacion = Postulacion.new(usuario: current_usuario, oferta: @ofertum)
  
    if @postulacion.save
      redirect_to @ofertum, notice: '¡Has aplicado a la oferta laboral exitosamente!'
    else
      redirect_to @ofertum, alert: 'Hubo un error al postularte a la oferta. Intenta nuevamente.'
    end
  end
  
  
  def postulaciones
    @oferta = Ofertum.find(params[:ofertum_id])

  end
  # GET /oferta or /oferta.json
  def index
    @oferta = Ofertum.all
  end

  # GET /oferta/1 or /oferta/1.json
  def show
    @ofertum= Ofertum.find(params[:id])
    @postulaciones = @ofertum.postulacions
  end
  


  # GET /oferta/new
  def new
    @ofertum = Ofertum.new
  end

  # GET /oferta/1/edit
  def edit
  end

  # POST /oferta or /oferta.json
  def create
    @ofertum = Ofertum.new(ofertum_params)

    respond_to do |format|
      if @ofertum.save
        format.html { redirect_to ofertum_url(@ofertum), notice: "Ofertum was successfully created." }
        format.json { render :show, status: :created, location: @ofertum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ofertum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oferta/1 or /oferta/1.json
  def update
    respond_to do |format|
      if @ofertum.update(ofertum_params)
        format.html { redirect_to ofertum_url(@ofertum), notice: "Ofertum was successfully updated." }
        format.json { render :show, status: :ok, location: @ofertum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ofertum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oferta/1 or /oferta/1.json
  def destroy
    @ofertum.destroy

    respond_to do |format|
      format.html { redirect_to oferta_url, notice: "Ofertum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ofertum
      @ofertum = Ofertum.find(params[:id])
    end

    def authenticate_admin
      unless usuario_signed_in? && current_usuario.admin?
        flash[:alert] = "Acceso no autorizado."
        redirect_to home_path
      end
    end
  
    def authorize_admin
      @oferta = Ofertum.find(params[:id])
      redirect_to home_path, alert: "Acceso no autorizado." unless current_usuario.admin?
    end

    # Only allow a list of trusted parameters through.
    def ofertum_params
      params.fetch(:ofertum, {})
    end
end
