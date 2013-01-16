OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '329266723839547', '1d695ad6ecd79426869b3025729ae23f'
end
