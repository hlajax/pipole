class AddSlugToRubrique < ActiveRecord::Migration[6.0]
  def change
    add_column :rubriques, :slug, :string
    add_index :rubriques, :slug, unique: true
  end
end
