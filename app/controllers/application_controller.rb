class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def default_url_options
    { locale: I18n.locale }
  end
  # http_basic_authenticate_with name: 'peck', password: '111111'
  # 'lifo' is username, 'world' is password
  # USERS = { "lifo" => "world" }
  # before_action :authenticate
  #
  # private
  #
  # def authenticate
  #   authenticate_or_request_with_http_digest do |username|
  #     USERS[username]
  #   end
  # end
end
