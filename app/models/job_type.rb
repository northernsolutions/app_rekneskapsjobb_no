class JobType < ApplicationRecord
  validates :name, presence: true
end
