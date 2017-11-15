// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/widgets/autocomplete
//= require autocomplete-rails
//= require_tree .

$(function() {
  if($('.flash-notice.notice').length > 0) {
    setTimeout(function() {
      $('.flash-notice.notice').slideUp();
    }, 3000);
  }
  
  $('.search-cep').on("click", function(event) {
    event.preventDefault();
    
    $.get('/search/cep', {cep: $('#cep-value').val()});
    return false;
  });
  
  $('body').on("click", '.delete-product', function(event) {
    event.preventDefault();
    
    if (confirm('Tem certeza que deseja excluir?')) {
      $.post('/vendas/delete_produto_venda', {produto_venda_id: $(this).data('produto-venda-id')});
    }
    
    return false;
  });
  
  $('#venda_cliente_nome_autocomplete').bind('railsAutocomplete.select', function(event, data) {
    $(this).addClass("InputDisabled");
    $('#venda_produto_nome_autocomplete').focus();
    $('#cliente_id').val(data.item.id);
  });
  
  $('#venda_cliente_edit').on("click", function() {
    $('#venda_cliente_nome_autocomplete').removeClass("InputDisabled");
    $('#cliente_id').val("");
    $('#venda_cliente_nome_autocomplete').val("");
    $('#venda_cliente_nome_autocomplete').focus();
  });
  
  $('#orcamento_cliente_nome_autocomplete').bind('railsAutocomplete.select', function(event, data) {
    $(this).addClass("InputDisabled");
    $('#orcamento_produto_nome_autocomplete').focus();
    $('#cliente_id').val(data.item.id);
  });
  
  $('#orcamento_cliente_edit').on("click", function() {
    $('#orcamento_cliente_nome_autocomplete').removeClass("InputDisabled");
    $('#cliente_id').val("");
    $('#orcamento_cliente_nome_autocomplete').val("");
    $('#orcamento_cliente_nome_autocomplete').focus();
  });
});
