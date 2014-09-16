class AddPreambleToPages < ActiveRecord::Migration
  def change
    add_column :pages, :preamble, :text
  end
end
