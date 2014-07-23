require 'rspec'
require 'bogus/rspec'

require_relative '../lib/cached_repository'

class Repository
  def find(id)
  end
end

RSpec.configure do |config|
  config.mock_with Bogus::RSpecAdapter
end

RSpec.describe CachedRepository do
  fake(:repository)

  it 'calls find only once' do
    cr = CachedRepository.new(repository)
    cr.find(5)
    cr.find(5)

    expect(repository).to have_received.find(5)
  end

  it 'return same value when called twice' do
    stub(repository).find(5) { :value }

    cr = CachedRepository.new(repository)
    expect(cr.find(5)).to eq(:value)
    expect(cr.find(5)).to eq(:value)
  end

  it 'can return different values when called with different args' do
    stub(repository).find(5) { :value }
    stub(repository).find(6) { :another_value }

    cr = CachedRepository.new(repository)
    expect(cr.find(5)).to eq(:value)
    expect(cr.find(6)).to eq(:another_value)
  end
end

RSpec.describe Repository do
  verify_contract(:repository)

  let(:repository) { subject }
end
