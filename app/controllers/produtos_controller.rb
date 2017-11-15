class ProdutosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  autocomplete :fornecedor, :nome, full: true

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all
    @produtos = @produtos.where("nome LIKE ?", "%#{params[:query]}%") if params[:query].present?
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)
    load_fornecedor

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto foi criado(a) com sucesso.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    load_fornecedor
    
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto foi atualizado(a) com sucesso.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    begin
      @produto.destroy
      respond_to do |format|
        format.html { redirect_to produtos_url, notice: 'Produto foi excluído com sucesso.' }
        format.json { head :no_content }
      end
    rescue
      respond_to do |format|
        format.html { redirect_to produtos_url, notice: 'Não é possível excluir produtos com venda.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:nome, :descricao, :preco, :fornecedor_nome)
    end
    
    def load_fornecedor
      if @produto.present? && produto_params[:fornecedor_nome].present?
        @produto.fornecedor_id = Fornecedor.find_by(nome: produto_params[:fornecedor_nome]).id
      end
    end
end
