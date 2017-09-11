class LoginFilter
  USERS = { "lifo" => "world" }
  def self.before(controller)
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
