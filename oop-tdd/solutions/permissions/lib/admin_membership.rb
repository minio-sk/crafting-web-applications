require_relative 'membership'

class AdminMembership < Membership
  def can_manage?(membership)
    return false if self == membership
    return false unless membership.same_account?(@account)
    membership.managable_by_admin?
  end

  def managable_by_admin?
    true
  end
end
