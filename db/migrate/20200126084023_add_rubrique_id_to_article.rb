class AddRubriqueIdToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :rubrique_id, :integer
  end
end
