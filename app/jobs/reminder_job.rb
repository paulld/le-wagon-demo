class ReminderJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    puts "I'm starting the job"
    user = User.find_by_id(user_id)
    if user
      puts "Sending the reminder email to #{user.email}"
      # call the Mailer
      sleep(3)
      puts "Job is done!"
    else
      puts "NO USER !!"
    end
  end
end
