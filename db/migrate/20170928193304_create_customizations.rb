class CreateCustomizations < ActiveRecord::Migration[5.1]
  def change
    create_table :customizations do |t|
      t.string :color_background
      t.string :color_border
      t.string :color_text
      t.string :color_highlight
      t.string :color_hover
      t.string :text_apt_suite
      t.string :text_inaccurate
      t.string :text_select_confirm
      t.string :text_select_suggestion
      t.string :text_suggest1
      t.text :text_suggest2

      t.timestamps
    end
  end
end
