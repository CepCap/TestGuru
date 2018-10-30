class TestsUser < ApplicationRecord
  belongs_to :tests
  belongs_to :users
end
