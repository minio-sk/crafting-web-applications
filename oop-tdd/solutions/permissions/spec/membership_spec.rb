require_relative '../lib/account'
require_relative '../lib/membership'

RSpec.describe Membership do
  context '#can_view?' do
    it 'allows to view account if member' do
      account = Account.new
      another_account = Account.new

      membership = described_class.new(account: account)

      expect(membership.can_view?(account)).to be_truthy
      expect(membership.can_view?(another_account)).to be_falsy
    end
  end
end
