module ApplicationHelper
  def auth_uri
    uri = ENV['OAUTH_URI']
    response_type = ENV['OAUTH_RESPONSE_TYPE']
    client_id = ENV['OAUTH_CLIENT_ID']
    rediredct_uri = ENV['OAUTH_REDIRECT_URI']

    uri + '?response_type=' + response_type + '&redirect_uri=' + rediredct_uri + '&client_id=' + client_id
  end

  def image_uri(photo)
    "http://localhost/3000/" + photo.filename
  end
end
