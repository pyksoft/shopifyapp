class AddOptionToCustomization < ActiveRecord::Migration[5.1]
  def change    
    add_column :customizations, :option_id, :integer
  end
end
