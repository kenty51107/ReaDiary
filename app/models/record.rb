class Record < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :book

  scope  :status_2, -> { where(status: 2) }
  with_options if: :status? do
    validates :rating, presence: true
    validates :headline, presence: true
    validates :content, presence: true
  end

  def status?
    status == 2
  end
end
