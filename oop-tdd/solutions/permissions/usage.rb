# routes.rb
# resources :accounts do
#   resources :members
# end

class MembersController #< ApplicationController
  def index # GET /accounts/123/members
    unless current_membership.can_view?(current_account)
      redirect_to root_path, flash: 'You are not authorized to view this page!'
    end

    @memberships = current_account.memberships
  end

  private
  def current_membership
    Membership.where(user_id: cookies[:id], account_id: params[:account_id]).first!
  end

  def current_account
    Account.find(params[:account_id])
  end
end

# # index.html.erb
#
# @memberships.each do |membership|
#   @current_membership.can_edit?(membership)
# end
