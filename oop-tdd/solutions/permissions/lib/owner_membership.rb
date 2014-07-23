require_relative 'membership'

class OwnerMembership < Membership
  def can_manage?(membership)
    return false if self == membership
    membership.same_account?(@account)
  end

  def managable_by_admin?
    false
  end
end
