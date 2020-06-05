class AddNomToLecteur < ActiveRecord::Migration[6.0]
  def change
    add_column :lecteurs, :nom, :string
  end
end
