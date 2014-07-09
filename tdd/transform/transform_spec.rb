require 'rspec'

class Hash
  def transform
    raise ArgumentError unless block_given?
    each_with_object({}) do |(k,v), hash|
      hash[k] = yield v
    end
  end
end


describe 'Hash can be transformed' do
  it 'handles simple case' do
    result = {'key' => 2, 'another' => 4 }.transform do |value|
      value * 2
    end

    expect(result).to eq({'key' => 4, 'another' => 8})
  end

  it 'throws exception when no block given' do
    expect { {}.transform }.to raise_error(ArgumentError)
  end
end
