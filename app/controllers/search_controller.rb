class SearchController < ApplicationController
  before_action :authenticate_user!
  
  def cep
    @finder = Correios::CEP::AddressFinder.new.get(params[:cep]) rescue nil
    Rails.logger.info @finder.inspect
  end
end
