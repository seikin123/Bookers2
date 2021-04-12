class Book < ApplicationRecord
  'validates :title, presence: true'
  'validates :nbody, presence: true'
  belongs_to :user
end
