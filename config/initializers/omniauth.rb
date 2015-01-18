OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1549989465270585'], ENV['5661739348e8f02f79936dd23d4053b4']
  # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end

