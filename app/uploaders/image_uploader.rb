class ImageUploader < ApplicationUploader
  process resize_to_fit: [600, 600]
end
