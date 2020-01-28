class Article < ApplicationRecord
	acts_as_votable
	extend FriendlyId
    friendly_id :titre, use: :slugged
    mount_uploader :image, ImageUploader
    belongs_to :rubrique
end
