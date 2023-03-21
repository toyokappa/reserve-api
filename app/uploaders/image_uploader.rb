class ImageUploader < ApplicationUploader
  version :thumb do
    process resize_to_limit: [600, 600]
  end

  version :high do
    process resize_to_limit: [1080, 1080]
  end
end
