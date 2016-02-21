OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1023027834423940', 'ee569e15ed8c652457833c17d62c1d29', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
