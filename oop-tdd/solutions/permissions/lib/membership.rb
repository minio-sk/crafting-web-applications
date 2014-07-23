class Membership
  def initialize(account: nil, user: nil)
    @account = account
    @user = user
  end

  def can_view?(another_account)
    @account == another_account
  end

  protected

  def same_account?(another)
    @account == another
  end
end

require_relative 'admin_membership'
require_relative 'regular_membership'
require_relative 'owner_membership'
