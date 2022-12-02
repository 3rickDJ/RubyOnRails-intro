class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  # title must be present
  validates :title, presence: true
  # body must be present
  # and be at least 10 characters long
  validates :body, presence: true, length: { minimum: 10}
end
