class Wall < ApplicationRecord
  belongs_to :user
  has_many :papers, dependent: :destroy
end
