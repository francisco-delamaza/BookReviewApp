CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = !Rails.env.test?
    config.root = Rails.root.join('public')
    config.store_dir = ENV.fetch('CARRIERWAVE_STORAGE_PATH', 'uploads')
end
  