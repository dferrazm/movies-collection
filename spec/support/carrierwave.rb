CarrierWave.configure do |config|
  config.storage = :file
  config.enable_processing = false
end

# make sure our uploader is auto-loaded
ImageUploader

# use different dirs when testing
CarrierWave::Uploader::Base.descendants.each do |klass|
  next if klass.anonymous?
  klass.class_eval do
    def cache_dir
      "#{Rails.root}/spec/support/uploads/tmp"
    end

    def store_dir
      "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{model.id}"
    end
  end
end

def sample_file
  Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/example.jpg"), "image/jpeg")
end
