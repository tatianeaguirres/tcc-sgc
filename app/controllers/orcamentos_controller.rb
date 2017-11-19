class OrcamentosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy, :recibo]
  autocomplete :cliente, :nome
  autocomplete :produto, :nome, display_value: :nome_com_preco, extra_data: [:preco]

  # GET /orcamentos
  # GET /orcamentos.json
  def index
    if session[:orcamento_id].present?
      @orcamento = Orcamento.find(session[:orcamento_id])
    else
      @orcamento = Orcamento.new
    end
  end

  # GET /orcamentos/1
  # GET /orcamentos/1.json
  def show
  end

  # GET /orcamentos/new
  def new
    @orcamento = Orcamento.new
  end

  # GET /orcamentos/1/edit
  def edit
  end

  # POST /orcamentos
  # POST /orcamentos.json
  def create
    if session[:orcamento_id].present?
      @orcamento = Orcamento.find(session[:orcamento_id])
    else
      @orcamento = Orcamento.new
      @orcamento.cliente = Cliente.find(params[:orcamento][:cliente_id])
      @orcamento.save
      
      session[:orcamento_id] = @orcamento.id
    end
    
    handle_orcamento_update
  end

  # PATCH/PUT /orcamentos/1
  # PATCH/PUT /orcamentos/1.json
  def update
    handle_orcamento_update
  end

  # DELETE /orcamentos/1
  # DELETE /orcamentos/1.json
  def destroy
    @orcamento.destroy
    respond_to do |format|
      format.html { redirect_to orcamentos_url, notice: 'Orcamento foi excluído(a) com sucesso.' }
      format.json { head :no_content }
    end
  end
  
  def delete_produto_orcamento
    @orcamento = Orcamento.find(session[:orcamento_id])
    @orcamento.produto_orcamentos.find(params[:produto_venda_id]).destroy
    @orcamento.calculate_total
    
    render "create"
  end
  
  def recibo
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "recibo", encoding: "UTF-8", margin:  { top: 0, bottom: 0, left: 0, right: 0 }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamento
      @orcamento = Orcamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orcamento_params
      params.require(:orcamento).permit(:emissao, :validade, :cliente_id)
    end
    
    def handle_orcamento_update
      @action = params[:button]
      
      if @action == "add-product"
        @invalid = false
        
        if params[:orcamento][:produto_id].present? && params[:quantidade].present?
          produto = Produto.find(params[:orcamento][:produto_id])
          @orcamento.produto_orcamentos.create produto: produto, quantidade: params[:quantidade]
          @orcamento.calculate_total
        else
          @invalid = true
        end
        
        render "create"
      else
        respond_to do |format|
          if @orcamento.produto_orcamentos.any? && @orcamento.update(emissao: Time.now)
            format.html { redirect_to @orcamento, notice: 'Orçamento foi atualizada com sucesso.' }
            format.json { render :show, status: :created, location: @orcamento }
            format.js { 
              session[:orcamento_id] = nil
              flash[:notice] = "Orçamento encerrado com sucesso."
              
              render :create 
            }
          else
            format.html { render :new }
            format.json { render json: @orcamento.errors, status: :unprocessable_entity }
            format.js { render :create }
          end
        end
      end
    end
end
