class RelatoriosController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @venda = Venda.all
    
    if params[:id] == "dia"
      @report_type = "por Dia"
      @vendas = @venda.where(data: params[:date].to_date.beginning_of_day..params[:date].to_date.end_of_day)
    else
      @report_type = "por Mês"
      @month = "#{params[:year]}-#{params[:month]}-1".to_date
      @vendas = @venda.where(data: @month.at_beginning_of_month..@month.at_end_of_month)
    end
    
    respond_to do |format|
      format.pdf do
        render pdf: "show", encoding: "UTF-8", margin:  { top: 0, bottom: 0, left: 0, right: 0 }
      end
    end
  end
end
