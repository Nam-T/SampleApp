require "csv"

class ExportCsvService
  def initialize user
    @user = user
  end

  def create_zip
    Zip::OutputStream.write_buffer(::StringIO.new('')) do |zos|
      #First file
      create_all_post_last_month_csv zos

      #Second file
      create_all_followed_last_month_csv zos

      #Third file
      create_all_followers_last_month_csv zos
    end
  end

  def create_all_post_last_month_csv(zos)
    zos.put_next_entry "all-post-last-month.csv"
      csv = CSV.generate do |csv|
        @user.microposts.where('created_at >= ?', 1.month.ago).each do |micropost|
          csv << ["Date","Post"]
          csv << [micropost.created_at, micropost.content]
        end
      end
    zos.print csv
  end

  def create_all_followed_last_month_csv(zos)
    zos.put_next_entry "all-followed-last-month.csv"
      csv = CSV.generate do |csv|
        Relationship.where(follower_id:@user.id).where('created_at >= ?', 1.month.ago).each do |relationship|
          followed_user = relationship.followed
          csv << ["Date","Name"]
          csv << [relationship.created_at , followed_user.name]
        end
      end
    zos.print csv
  end

  def create_all_followers_last_month_csv(zos)
    zos.put_next_entry "all-followers-last-month.csv"
      csv = CSV.generate do |csv|
        Relationship.where(followed_id:@user.id).where('created_at >= ?', 1.month.ago).each do |relationship|
          follower_user = relationship.follower
          csv << ["Date", "Name"]
          csv << [relationship.created_at, follower_user.name]
        end
      end
    zos.print csv
  end
end