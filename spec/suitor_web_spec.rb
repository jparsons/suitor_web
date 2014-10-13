require File.expand_path '../spec_helper.rb', __FILE__

require 'suitor'

describe "Suitor Web" do
  describe "GET index" do
    it "should allow accessing the home page" do
      get '/'
      expect(last_response).to be_ok
    end
    it "should display a form for sending messages" do
      get '/'
      expect(last_response.body).to include "Send a message from Reddit!!"
      expect(last_response.body).to include "form"
    end
  end

  describe "POST send_message" do
    it "should send a success message when successful" do
      expect(Suitor::MessageSender).to receive(:send_post_from_subreddit){ "Success"}
      post '/send_message', phone_number: '5555555555', subreddit: 'ruby'
      expect(last_response.body).to include "Great Job"
    end

    it "should send an error message when a failure occurs" do
      expect(Suitor::MessageSender).to receive(:send_post_from_subreddit){ raise RuntimeError}
      post '/send_message', phone_number: '5555555555', subreddit: 'ruby'
      expect(last_response.body).to include "Sorry"
    end
  end

  describe "POST get_random_subreddit" do
    it "should return a subreddit when successful" do
      expect(Suitor::SubredditFinder).to receive(:get_random_subreddit){ "news"}
      post '/get_random_subreddit'
      expect(last_response.body).to eql "news"
    end

  end
end