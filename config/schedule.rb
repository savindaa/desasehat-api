set :environment, Rails.env
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 1.day, at: '1:00 am' do
  rake "task:campaign"
end