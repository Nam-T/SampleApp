require 'test_helper'

class WeeklyStatisticsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:michael)
  end

  test "weekly statistics" do
    # Inactive user
  end
end
