class Comment < ApplicationRecord
  include visible
  belongs_to :article
end
