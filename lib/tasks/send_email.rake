namespace :send_email do
    desc "Send email user"
  
    task weekly: :environment do
      User.all.each do |user|
        user.send_weekly_statistics_mail
      end
        # User.last.send_weekly_statistics_mail
    end
  end