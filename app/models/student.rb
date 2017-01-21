class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_items, through: :participations
  has_many :subject_item_notes, dependent: :destroy
  accepts_nested_attributes_for :subject_items
  validates :first_name, :last_name, presence: true
end
