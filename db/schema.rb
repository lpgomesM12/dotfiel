# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161108013020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cidades", force: :cascade do |t|
    t.string   "nome_cidade"
    t.boolean  "flag_ativo"
    t.integer  "estado_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "clienteempresas", force: :cascade do |t|
    t.integer  "empresa_id"
    t.integer  "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clienteempresas", ["empresa_id"], name: "index_clienteempresas_on_empresa_id", using: :btree
  add_index "clienteempresas", ["pessoa_id"], name: "index_clienteempresas_on_pessoa_id", using: :btree

  create_table "contcodigoclientes", force: :cascade do |t|
    t.integer  "codigo",     limit: 8
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "nome_empresa"
    t.string   "cnpj"
    t.string   "nome_responsavel"
    t.string   "desc_telefone"
    t.integer  "endereco_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "empresas", ["endereco_id"], name: "index_empresas_on_endereco_id", using: :btree

  create_table "enderecos", force: :cascade do |t|
    t.string   "endereco"
    t.string   "complemento"
    t.string   "numero"
    t.string   "cep"
    t.integer  "cidade_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "enderecos", ["cidade_id"], name: "index_enderecos_on_cidade_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "nome_estado"
    t.string   "sigl_estado"
    t.boolean  "flag_ativo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string   "nome_primeiro"
    t.string   "nome_sobrenome"
    t.string   "cpf"
    t.integer  "endereco_id"
    t.date     "data_nascimento"
    t.string   "email"
    t.string   "sexo"
    t.integer  "codigo_cliente",  limit: 8
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "pessoas", ["endereco_id"], name: "index_pessoas_on_endereco_id", using: :btree
  add_index "pessoas", ["integer"], name: "index_pessoas_on_integer", using: :btree
  add_index "pessoas", ["user_inclusao"], name: "index_pessoas_on_user_inclusao", using: :btree

  create_table "pontoclientes", force: :cascade do |t|
    t.integer  "numr_ponto"
    t.decimal  "valor_gasto"
    t.string   "desc_ponto"
    t.boolean  "flag_resgatado"
    t.integer  "empresa_id"
    t.integer  "clienteempresa_id"
    t.integer  "regraponto_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "premio_id"
  end

  add_index "pontoclientes", ["clienteempresa_id"], name: "index_pontoclientes_on_clienteempresa_id", using: :btree
  add_index "pontoclientes", ["empresa_id"], name: "index_pontoclientes_on_empresa_id", using: :btree
  add_index "pontoclientes", ["integer"], name: "index_pontoclientes_on_integer", using: :btree
  add_index "pontoclientes", ["premio_id"], name: "index_pontoclientes_on_premio_id", using: :btree
  add_index "pontoclientes", ["regraponto_id"], name: "index_pontoclientes_on_regraponto_id", using: :btree
  add_index "pontoclientes", ["user_inclusao"], name: "index_pontoclientes_on_user_inclusao", using: :btree

  create_table "premios", force: :cascade do |t|
    t.string   "nome_premio"
    t.integer  "numr_ponto"
    t.string   "desc_premio"
    t.integer  "empresa_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.integer  "user_exclusao"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "premios", ["empresa_id"], name: "index_premios_on_empresa_id", using: :btree
  add_index "premios", ["integer"], name: "index_premios_on_integer", using: :btree
  add_index "premios", ["user_exclusao"], name: "index_premios_on_user_exclusao", using: :btree
  add_index "premios", ["user_inclusao"], name: "index_premios_on_user_inclusao", using: :btree

  create_table "regrapontos", force: :cascade do |t|
    t.string   "nome_regra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "empresa_id"
    t.integer  "pessoa_id"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["empresa_id"], name: "index_users_on_empresa_id", using: :btree
  add_index "users", ["pessoa_id"], name: "index_users_on_pessoa_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cidades", "estados"
  add_foreign_key "clienteempresas", "empresas"
  add_foreign_key "clienteempresas", "pessoas"
  add_foreign_key "empresas", "enderecos"
  add_foreign_key "enderecos", "cidades"
  add_foreign_key "pessoas", "enderecos"
  add_foreign_key "pontoclientes", "clienteempresas"
  add_foreign_key "pontoclientes", "empresas"
  add_foreign_key "pontoclientes", "premios"
  add_foreign_key "pontoclientes", "regrapontos"
  add_foreign_key "premios", "empresas"
  add_foreign_key "users", "empresas"
  add_foreign_key "users", "pessoas"
end
