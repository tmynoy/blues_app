class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :user

  validates :content, presence: true, length: { maximum: 20 }
end
