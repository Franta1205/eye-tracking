class Analysis < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :participants, presence: true
  validates :analysis_type, presence: true

  enum analysis_type: {
    general_design: 0,
    general_advertisement: 1,
    banner: 2,
    website: 3,
    product: 4,
    other: 5,
  }
end
