class VendasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_venda, only: [:show, :edit, :update, :destroy, :recibo]
  autocomplete :cliente, :nome
  autocomplete :produto, :nome, display_value: :nome_com_preco, extra_data: [:preco]
  
  # GET /vendas
  # GET /vendas.json
  def index
    if session[:venda_id].present?
      @venda = Venda.find(session[:venda_id])
    else
      @venda = Venda.new
    end
  end

  # GET /vendas/1
  # GET /vendas/1.json
  def show
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
    @venda.produto.build
  end
  
  def create
    if session[:venda_id].present?
      @venda = Venda.find(session[:venda_id])
    else
      @venda = Venda.new
      @venda.cliente = Cliente.find(params[:venda][:cliente_id])
      @venda.status = false
      @venda.save
      
      session[:venda_id] = @venda.id
    end
    
    handle_venda_update
  end

  # GET /vendas/1/edit
  def edit
  end
  
  # PATCH/PUT /vendas/1
  # PATCH/PUT /vendas/1.json
  def update
    handle_venda_update
  end

  # DELETE /vendas/1
  # DELETE /vendas/1.json
  def destroy
    @venda.destroy
    respond_to do |format|
      format.html { redirect_to vendas_url, notice: 'Venda foi excluído(a) com sucesso.' }
      format.json { head :no_content }
    end
  end
  
  def delete_produto_venda
    @venda = Venda.find(session[:venda_id])
    @venda.produto_vendas.find(params[:produto_venda_id]).destroy
    
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
    def set_venda
      @venda = Venda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venda_params
      params.require(:venda).permit(:data, :preco_total, :status, :cliente_id, produto_attributes: [:nome, :_destroy])
    end
    
    def handle_venda_update
      if params[:button] == "add-product"
        @invalid = false
        
        if params[:venda][:produto_id].present? && params[:quantidade].present?
          produto = Produto.find(params[:venda][:produto_id])
          @venda.produto_vendas.create produto: produto, quantidade: params[:quantidade]
          @venda.calculate_total
        else
          @invalid = true
        end
        
        render "create"
      else
        respond_to do |format|
          if @venda.update(status: true, data: Time.now)
            VendaCaixa.create venda: @venda, caixa: current_caixa
            
            format.html { redirect_to @venda, notice: 'Venda foi atualizada com sucesso.' }
            format.json { render :show, status: :created, location: @venda }
            format.js { 
              session[:venda_id] = nil
              flash[:notice] = "Venda encerrada com sucesso."
              
              render :create 
            }
          else
            format.html { render :new }
            format.json { render json: @venda.errors, status: :unprocessable_entity }
            format.js { render :create }
          end
        end
      end
    end
end
