class Rubrique < ApplicationRecord
	has_many :articles
	extend FriendlyId
    friendly_id :titre, use: :slugged
end
