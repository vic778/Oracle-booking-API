class ImageUploader < CarrierWave::Uploader::Base
  # if Rails.env == 'test' || 'development'
  #   storage :file
  #   def store_dir
  #     "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #   end
  # else
    include Cloudinary::CarrierWave

  #   process convert: 'png'
  #   process tags: ['profile_picture']

  #   # version :standard do
  #   #   process resize_to_fill: [100, 150, :north]
  #   # end

  #   # version :thumbnail do
  #   #   resize_to_fit(50, 50)
  #   # end

  #   CarrierWave.configure do |config|
  #     config.cache_storage = :file
  #   end
  # end

  # def extension_allowlist
  #   %w[jpg jpeg gif png]
  # end
end
