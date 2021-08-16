class UpdateCatsAgain < ActiveRecord::Migration[5.2]
  def change
    add_index :cats, :user_id, unique: true  
  end
end
