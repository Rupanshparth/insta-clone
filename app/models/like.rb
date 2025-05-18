class Like < ApplicationRecord
  belongs_to :account
  belongs_to :post

  validates :account_id, uniqueness: { scope: :post_id }  # one like per user per post
end
