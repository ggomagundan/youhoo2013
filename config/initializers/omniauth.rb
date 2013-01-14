OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '428731780533410', 'fdd10a7a7b62f24e2741b01ba2161d64'
end
