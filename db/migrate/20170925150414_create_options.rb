class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.boolean :auto_complete
      t.boolean :validate_address
      t.boolean :pobox_warning
      t.boolean :streetnum_warning

      t.timestamps
    end
  end
end
