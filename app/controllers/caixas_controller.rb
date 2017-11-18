class CaixasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_caixa, only: [:show, :edit, :update, :destroy, :close]

  # GET /caixas
  # GET /caixas.json
  def index
    @caixas = Caixa.order(data: :desc)
  end

  # GET /caixas/1
  # GET /caixas/1.json
  def show
  end

  # GET /caixas/new
  def new
    @caixa = Caixa.new
  end

  # GET /caixas/1/edit
  def edit
  end

  # POST /caixas
  # POST /caixas.json
  def create
    @caixa = Caixa.new(caixa_params)
    @caixa.data = Time.now

    if caixa_params[:status] && (current_caixa.try(:status) && current_caixa.try(:id) != @caixa.id)
      redirect_to caixas_path, alert: "Não foi possível atualizar, já há um caixa em aberto." and return
    end

    respond_to do |format|
      if @caixa.save
        format.html { redirect_to caixas_path, notice: 'Caixa foi criado(a) com sucesso.' }
        format.json { render :show, status: :created, location: @caixa }
      else
        format.html { render :new }
        format.json { render json: @caixa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caixas/1
  # PATCH/PUT /caixas/1.json
  def update
    if caixa_params[:status] && (current_caixa.try(:status) && current_caixa.try(:id) != @caixa.id)
      redirect_to caixas_path, alert: "Não foi possível atualizar, já há um caixa em aberto." and return
    end

    respond_to do |format|
      if @caixa.update(caixa_params)
        format.html { redirect_to @caixa, notice: 'Caixa foi atualizado(a) com sucesso.' }
        format.json { render :show, status: :ok, location: @caixa }
      else
        format.html { render :edit }
        format.json { render json: @caixa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caixas/1
  # DELETE /caixas/1.json
  def destroy
    @caixa.destroy
    respond_to do |format|
      format.html { redirect_to caixas_url, notice: 'Caixa foi excluído(a) com sucesso.' }
      format.json { head :no_content }
    end
  end

  def close
    if @caixa.update(status: false)
      redirect_to caixas_url, notice: "Caixa fechado com sucesso."
    else
      redirect_to caixas_url, alert: "Não foi possível fechar o caixa."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caixa
      @caixa = Caixa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caixa_params
      params.require(:caixa).permit(:data, :responsavel, :status)
    end
end
