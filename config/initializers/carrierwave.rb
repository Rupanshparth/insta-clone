CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['ACCESS_KEY'],                        # required unless using use_iam_profile
      aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
      region:                'eu-north-1',                        # required unless using use_iam_profile
    }
    config.storage = :fog
    config.permissions = 0666
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.fog_directory  = ENV['S3_BUCKET']                                      # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
    # Use this if you have AWS S3 ACLs disabled.
    # config.fog_attributes = { 'x-amz-acl' => 'bucket-owner-full-control' }
    # Use this if you have Google Cloud Storage uniform bucket-level access enabled.
    # config.fog_attributes = { uniform: true }
    # For an application which utilizes multiple servers but does not need caches persisted across requests,
    # uncomment the line :file instead of the default :storage.  Otherwise, it will use AWS as the temp cache store.
    # config.cache_storage = :file
  end