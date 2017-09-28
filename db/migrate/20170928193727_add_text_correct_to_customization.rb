class AddTextCorrectToCustomization < ActiveRecord::Migration[5.1]
  def change
    add_column :customizations, :text_correct, :string
  end
end
