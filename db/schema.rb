# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171105214635) do

  create_table "caixas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "data"
    t.string "responsavel"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome"
    t.string "celular"
    t.string "telefone"
    t.string "email"
    t.string "cpf"
    t.bigint "endereco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endereco_id"], name: "index_clientes_on_endereco_id"
  end

  create_table "enderecos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "endereco"
    t.integer "numero"
    t.string "complemento"
    t.string "cidade"
    t.string "estado"
    t.string "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fornecedors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "tipo_pessoa"
    t.string "nome"
    t.string "documento"
    t.string "telefone"
    t.string "ramal"
    t.string "celular"
    t.string "email"
    t.string "site"
    t.bigint "endereco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endereco_id"], name: "index_fornecedors_on_endereco_id"
  end

  create_table "orcamentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "emissao"
    t.datetime "validade"
    t.bigint "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "preco_total", precision: 6, scale: 2
    t.index ["cliente_id"], name: "index_orcamentos_on_cliente_id"
  end

  create_table "produto_orcamentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "produto_id"
    t.bigint "orcamento_id"
    t.integer "quantidade"
    t.index ["orcamento_id"], name: "index_produto_orcamentos_on_orcamento_id"
    t.index ["produto_id"], name: "index_produto_orcamentos_on_produto_id"
  end

  create_table "produto_vendas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "produto_id"
    t.bigint "venda_id"
    t.integer "quantidade"
    t.index ["produto_id"], name: "index_produto_vendas_on_produto_id"
    t.index ["venda_id"], name: "index_produto_vendas_on_venda_id"
  end

  create_table "produtos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome"
    t.string "descricao"
    t.decimal "preco", precision: 6, scale: 2
    t.bigint "fornecedor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fornecedor_id"], name: "index_produtos_on_fornecedor_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venda_caixas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "venda_id"
    t.bigint "caixa_id"
    t.index ["caixa_id"], name: "index_venda_caixas_on_caixa_id"
    t.index ["venda_id"], name: "index_venda_caixas_on_venda_id"
  end

  create_table "vendas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "data"
    t.decimal "preco_total", precision: 6, scale: 2
    t.boolean "status"
    t.bigint "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id"
  end

  add_foreign_key "clientes", "enderecos"
  add_foreign_key "fornecedors", "enderecos"
  add_foreign_key "orcamentos", "clientes"
  add_foreign_key "produto_orcamentos", "orcamentos", name: "produtos_orcamentos_fk"
  add_foreign_key "produto_orcamentos", "produtos", name: "orcamentos_produtos_fk"
  add_foreign_key "produto_vendas", "produtos", name: "produtos_vendas_fk"
  add_foreign_key "produto_vendas", "vendas", name: "vendas_produtos_fk"
  add_foreign_key "produtos", "fornecedors"
  add_foreign_key "venda_caixas", "caixas", name: "caixas_venda_fk"
  add_foreign_key "venda_caixas", "vendas", name: "vendas_caixas_fk"
  add_foreign_key "vendas", "clientes"
end
