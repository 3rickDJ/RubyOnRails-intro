class Article < ApplicationRecord
  has_many :comments
  # title must be present
  validates :title, presence: true
  # body must be present
  # and be at least 10 characters long
  validates :body, presence: true, length: { minimum: 10}

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES}

  def archived?
    status == 'archived'
  end
end
