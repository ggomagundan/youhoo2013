CarrierWave.configure do |config|
    config.fog_credentials = {
          :provider               => 'AWS',                        # required
          :aws_access_key_id      => 'AKIAI5XK23CYUD7YUHCA',                        # required
          :aws_secret_access_key  => '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',                        # required
    }
    config.fog_directory  = 'uhootest'                     # required
    config.fog_public     = true                                   # optional, defaults to true
end
