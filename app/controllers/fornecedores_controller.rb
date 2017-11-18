class FornecedoresController < ApplicationController

  before_action :authenticate_user!
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  # GET /fornecedors
  # GET /fornecedors.json
  def index
    @fornecedores = Fornecedor.all
    @fornecedores = Fornecedor.where("nome LIKE ?", "%#{params[:query]}%") if params[:query].present?
  end

  # GET /fornecedors/1
  # GET /fornecedors/1.json
  def show
  end

  # GET /fornecedors/new
  def new
    @fornecedor = Fornecedor.new
    @fornecedor.build_endereco
  end

  # GET /fornecedors/1/edit
  def edit
  end

  # POST /fornecedors
  # POST /fornecedors.json
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to fornecedores_path, notice: 'Fornecedor foi salvo com sucesso.' }
        format.json { render :show, status: :created, location: @fornecedor }
      else
        format.html { render :new }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fornecedors/1
  # PATCH/PUT /fornecedors/1.json
  def update
    respond_to do |format|
      if @fornecedor.update(fornecedor_params)
        format.html { redirect_to fornecedore_path(@fornecedor), notice: 'Fornecedor foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @fornecedor }
      else
        format.html { render :edit }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedors/1
  # DELETE /fornecedors/1.json
  def destroy
    begin
      @fornecedor.destroy
      respond_to do |format|
        format.html { redirect_to fornecedores_path, notice: 'Fornecedor foi excluído com sucesso.' }
        format.json { head :no_content }
      end
    rescue
      format.html { redirect_to fornecedores_path, notice: 'Este fornecedor não pode ser excluido, pois ele já possui vendas.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fornecedor_params
      params.require(:fornecedor).permit(
        :tipo_pessoa, :nome, :documento, :telefone, :ramal, :celular, :email, :site,
        endereco_attributes: [:endereco, :numero, :complemento, :cidade, :estado, :cep]
      )
    end
end
