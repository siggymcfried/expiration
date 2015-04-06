class NullUser
  def username
    'Not logged in'
  end

  def authenticate(*)
    false
  end
end