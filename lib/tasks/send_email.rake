namespace :send_email do
    desc "Send email user"
  
    task weekly: :environment do
      User.all.each do |user|
        UserMailer.weekly_statistics(user).deliver_now
      end
      
      # User.last.send_weekly_statistics_mail
    end
  end