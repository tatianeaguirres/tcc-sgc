namespace :setup do
  
  desc "Dados iniciais"
  task all: :environment do
    User.create! email: "admin@exemplo.com", password: "mudarsenha123", password_confirmation: "mudarsenha123"
  end
  
end