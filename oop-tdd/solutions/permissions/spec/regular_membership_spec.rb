require_relative '../lib/account'
require_relative '../lib/membership'

RSpec.describe RegularMembership, :type => :model do
  context '#can_manage?' do
    it 'cannot manage anything' do
      regular = RegularMembership.new
      admin = AdminMembership.new
      owner = OwnerMembership.new

      expect(subject.can_manage?(regular)).to be_falsey
      expect(subject.can_manage?(admin)).to be_falsey
      expect(subject.can_manage?(owner)).to be_falsey
    end
  end

  context '#managable_by_admin?' do
    it { should be_managable_by_admin }
  end
end
