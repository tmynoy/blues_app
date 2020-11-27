class Evaluation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :total
  belongs_to :offence
  belongs_to :deffence
  belongs_to :pass
  belongs_to :dribble
  belongs_to :physical
  belongs_to :pace
  belongs_to :user
  belongs_to :member

  with_options numericality: { other_than: 0 } do
    validates :total_id
    validates :offence_id
    validates :deffence_id
    validates :pass_id
    validates :dribble_id
    validates :physical_id
    validates :pace_id
  end
end

