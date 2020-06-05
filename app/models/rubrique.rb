class Rubrique < ApplicationRecord
	has_many :articles
	extend FriendlyId
    friendly_id :titre, use: :slugged
    def should_generate_new_friendly_id?
    	titre_changed?
  	end
  	mount_uploader :avatar, ImageUploader
end
