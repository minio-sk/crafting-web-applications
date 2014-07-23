require 'rspec'
require_relative '../lib/cached_repository'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
  end
end

class Repository
  def find(id)
    raise NotImplementedError
  end
end

RSpec.describe CachedRepository do
  it 'calls find only once' do
    repository = instance_double('Repository').as_null_object
    cr = CachedRepository.new(repository)
    cr.find(5)
    cr.find(5)

    expect(repository).to have_received(:find).once
  end

  it 'return same value when called twice' do
    repository = instance_double('Repository', find: :value)

    cr = CachedRepository.new(repository)
    expect(cr.find(5)).to eq(:value)
    expect(cr.find(5)).to eq(:value)
  end

  it 'can return different values when called with different args' do
    repository = instance_double('Repository')
    allow(repository).to receive(:find).with(5).and_return(:value)
    allow(repository).to receive(:find).with(6).and_return(:another_value)

    cr = CachedRepository.new(repository)
    expect(cr.find(5)).to eq(:value)
    expect(cr.find(6)).to eq(:another_value)
  end
end
