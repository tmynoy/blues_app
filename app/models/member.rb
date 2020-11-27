class Member < ApplicationRecord
  has_many :comments
  has_many :evaluations
end
