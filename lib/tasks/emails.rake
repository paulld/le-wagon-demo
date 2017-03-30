namespace :emails do
  desc "Clean old user"
  task :send_reminder => :environment do
    User.all.each do |user|
      ReminderJob.perform_now(user.id)
    end
  end
end
