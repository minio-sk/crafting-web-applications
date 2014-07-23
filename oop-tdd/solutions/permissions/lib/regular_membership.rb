require_relative 'membership'

class RegularMembership < Membership
  def can_manage?(_)
    false
  end

  def managable_by_admin?
    true
  end
end
