class Article < ApplicationRecord
	acts_as_votable
	extend FriendlyId
    friendly_id :titre, use: :slugged
    def should_generate_new_friendly_id?
    titre_changed?
  	end
    mount_uploader :image, ImageUploader
    belongs_to :rubrique
    has_rich_text :contenu
end
