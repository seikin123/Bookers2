class User < ApplicationRecord
        'validates :name, presence: true'
        
        'validates :introdution, presence: true'
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
attachment :profile_image
        has_many :books, dependent: :destroy
end
