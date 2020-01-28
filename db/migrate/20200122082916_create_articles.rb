class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :titre
      t.text :contenu
      t.string :agree
      t.string :disagree
      t.string :slug
      t.string :image

      t.timestamps
    end
  end
end
