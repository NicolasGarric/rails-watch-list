class Bookmark < ApplicationRecord
  belongs_to :movies
  belongs_to :list
end
