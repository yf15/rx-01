require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(account:"example", email:"example@example.com", nickname: "example", password:"123456", password_confirmation: "123456")
  end

  test "should be valid" do
    assert @user.valid?
  end
  test "account should be present" do
    @user.account = "      "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "      "
    assert_not @user.valid?
  end

  test "nickname should be present" do
    @user.nickname = "      "
    assert_not @user.valid?
  end

  test "account should not be longer that 50" do
    @user.account = "a"*51
    assert_not @user.valid?
  end

  test "email should not be longer that 255" do
    @user.email = "a"*256
    assert_not @user.valid?
  end

  test "nickname should not be longer that 50" do
    @user.nickname = "a"*51
    assert_not @user.valid?
  end

  test "account,email,nickname should be unique" do
    duplicate_user = @user.dup
     duplicate_user.email = @user.email.upcase
     # duplicate_user.account = @user.account.upcase
     # duplicate_user.nickname = @user.nickname.upcase

    @user.save
    assert_not duplicate_user.valid?
  end



end
