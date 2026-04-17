module RequestHelpers
  def login_as(user)
    post '/login', params: { email: user.email, password: "abcdefg" } # from factorybot user
  end
end
