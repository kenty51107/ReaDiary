class Record < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :book
end
