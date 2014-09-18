class AddPreambleToPages < ActiveRecord::Migration
  def change
    add_column :pages, :preamble, :text, :default => ''
  end
end
