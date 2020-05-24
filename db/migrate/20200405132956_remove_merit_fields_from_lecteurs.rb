class RemoveMeritFieldsFromLecteurs < ActiveRecord::Migration[6.0]
  def self.up
    remove_column :lecteurs, :sash_id
    remove_column :lecteurs, :level
  end
end
