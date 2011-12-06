class Message < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :body
  
  validates :body, :presence => true
  
  after_save :schedule_tweet
  
  def publish_at=(datetime)
    self[:publish_at] = ChronicDuration.parse(datetime)
  end
  
  private
  def schedule_tweet
    if Time.zone.now >= publish_at
      client = Twitter::Client.new(:oauth_token => user.twitter_access_token, :oauth_token_secret => user.twitter_access_secret)
      client.update(body)
    end
  end
  handle_asynchronously :schedule_tweet, :run_at => Proc.new {|p| p.publish_at }
  
end
