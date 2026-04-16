OmniAuth.config.test_mode = true

def mock_google_auth(email: 'google@example.com', uid: '123456', name: 'Google User')
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
    provider: 'google_oauth2',
    uid:      uid,
    info: {
      email:      email,
      name:       name,
      first_name: name.split.first
    }
  )
end
