class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :account
    has_many :likes, dependent: :destroy
    has_many :liked_by_accounts, through: :likes, source: :account
    scope :active, -> { where(active: true) }
end
