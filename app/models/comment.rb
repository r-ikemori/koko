class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post_content, optional: true
end
