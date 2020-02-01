require 'test_helper'

class AuthorizationTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @auth = @user.authorizations.build(provider: 'facebook', uid:"My String")
  end

  test "should be valid" do
    assert @auth.valid?
  end

  test "user_id, provider, uid should be present" do
    @auth.user_id = nil
    @auth.provider = nil
    @auth.uid = nil
    assert_not @auth.valid?
  end
end
