class PictureFile < ApplicationRecord
  after_destroy PictureFileCallbacks.new
end
