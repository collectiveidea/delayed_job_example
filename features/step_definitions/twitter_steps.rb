Then /^a tweet should be posted with "([^"]*)"$/ do |tweet|
  URI.decode(FakeWeb.last_request.body).gsub('+', ' ').should include(tweet)
end