class Analysis < ApplicationRecord
  belongs_to :user

  enum analysis_type: {
    general_design: 0,
    general_advertisement: 1,
    banner: 2,
    website: 3,
    product: 4,
    other: 5,
  }
end
