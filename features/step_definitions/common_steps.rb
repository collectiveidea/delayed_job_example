Given 'I am tracking twitter traffic' do
  FakeWeb.register_uri(:post, 'https://api.twitter.com/1/statuses/update.json', :status => ["200", "OK"])
end

Given 'delayed jobs are run' do
  success, fail = Delayed::Worker.new.work_off
  unless fail.zero?
    puts Delayed::Job.all.reject{|j| j.last_error.blank? }.to_yaml
    raise "#{fail}/#{success} delayed jobs failed."
  end
end

When /^the time is "([^"]*)"$/ do |time|
  Timecop.travel(Time.zone.parse(time))
  Given "delayed jobs are run"
end
