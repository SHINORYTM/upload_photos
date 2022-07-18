class OauthController < ApplicationController
  def callback
    code = params[:code]
    if code.present?
      uri = ENV['OAUTH_TOKEN_URI']
      uri = uri + '?client_id=' + ENV['OAUTH_CLIENT_ID'] + '&client_secret=' + ENV['OAUTH_CLIENT_SECRET'] + '&redirect_uri=' + ENV['OAUTH_REDIRECT_URI'] + '&grant_type=' + ENV['OAUTH_GRANT_TYPE'] + '&code=' + code
      uri = URI.parse(uri)

      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/x-www-form-urlencoded'
      http.use_ssl = true

      response = http.request(request)
      token = JSON.parse(response.body)['access_token']

      session[:oauth_access_token] = token
    end

    redirect_to root_path
  end

  def tweet
    uri = ENV['OAUTH_TWEET_URI']
    uri = URI.parse(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request_body = {
      text: tweet_params[:title],
      url: tweet_params[:url]
    }

    request = Net::HTTP::Post.new(uri.request_uri)
    request.body = request_body.to_json
    request['Content-Type'] = 'application/json'
    request['Authorization'] = "Bearer #{session[:oauth_access_token]}"
    response = http.request(request)

    redirect_to root_path
  end

  private

  def tweet_params
    params.permit(:title, :url)
  end
end