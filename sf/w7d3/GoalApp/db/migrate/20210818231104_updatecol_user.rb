class UpdatecolUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :session_token, :string, null: false
  end
end
