class Participation < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject_item

  validates :student, :subject_item, presence: true
  validates :student, uniqueness: { scope: :subject_item }
end
