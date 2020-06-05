class AddAvatarToLecteur < ActiveRecord::Migration[6.0]
  def change
    add_column :lecteurs, :avatar, :string
  end
end
