Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], skip_jwt: true # Error JWT invalid iat (https://github.com/zquestz/omniauth-google-oauth2/issues/197)
end