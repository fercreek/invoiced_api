class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :slug
      t.text :address
      t.string :tax_payer_number

      t.timestamps
    end
    add_index :organizations, :slug, unique: true
  end
end
