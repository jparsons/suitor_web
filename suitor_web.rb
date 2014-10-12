require 'sinatra'

class SuitorWeb < Sinatra::Base
  get '/' do
    haml :index
  end

  post '/send_message' do
    @subreddit = params[:subreddit]
    @phone_number = params[:phone_number]
    begin
      Suitor::MessageSender.send_post_from_subreddit(@subreddit, @phone_number)
      haml :success, layout: false
    rescue => e
      haml :failure, layout: false
    end

  end
end
