class Book < ApplicationRecord
  has_one :record, dependent: :destroy
  belongs_to :user
  validates :isbn_10, uniqueness: true
  validates :isbn_13, uniqueness: true
end
