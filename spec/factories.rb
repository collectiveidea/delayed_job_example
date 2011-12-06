FactoryGirl.define do
  factory :user do
    name "bryckbost"
    twitter_uid{ rand(1_000_000_000) }
    characters = [("a".."z"), ("A".."Z"), ("0".."9")].map(&:to_a).sum
    twitter_access_token{|u| "#{u.twitter_uid}-#{Array.new(41){ characters.sample }.join}" }
  end
end
