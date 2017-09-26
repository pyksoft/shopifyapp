class AddDomainToOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :domain, :string
  end
end
