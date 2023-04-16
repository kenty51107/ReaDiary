class Record < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :book

  with_options if: :status? do
    validates :rating, presence: true
    validates :headline, presence: true
    validates :content, presence: true
  end

  def status?
    status == 2
  end
end
