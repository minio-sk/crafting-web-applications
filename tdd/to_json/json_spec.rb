require 'rspec'

class Hash
  def to_json
    result = '{'
    result += map do |k, v|
      "#{k.to_json} : #{v.to_json}"
    end.join(', ')
    result + '}'
  end
end

class Array
  def to_json
    result = '['
    result += map { |value| value.to_json }.join(', ')
    result + ']'
  end
end

class String
  def to_json
    "\"#{to_s}\""
  end
end

class Numeric
  def to_json
    to_s
  end
end

class TrueClass
  def to_json
    to_s
  end
end

class FalseClass
  def to_json
    to_s
  end
end

class NilClass
  def to_json
    'null'
  end
end

# alternativa JANI

# class Object
#   def to_json
#     to_s
#   end
# end


# alternativa ANDREJ

class JSONConverter
  def self.convert(object)
    case object
      when TrueClass
        'true'
      when Hash
        convert_hash(object)
      when Array
        convert_array(object)
      else
        if object.respond_to?(:to_json)
          object.to_json
        else
          raise ArgumentError
        end
    end
  end


  private

  def self.convert_hash(hash)
    result = '{'
    result += hash.map do |k, v|
      "#{convert(k)} : #{convert(v)}"
    end.join(', ')
    result + '}'
  end
end






# alternativa SLAVO - java

# class JSONConverter
#   def self.to_json(JSONSerializable object)
#
#   end
# end

# JSONConverter.new.convert(object)

class JSONConverter
  def initialize(map = {})
    @map = {
      Hash => HashJSONConverter,
      Array => ArrayJSONConverter,
      # ...
    }.merge(map)
  end

  def convert(object)
    @map[object.class].convert(object, self)
  end

  class HashJSONConverter
    def self.convert(hash, converter)
      hash.each_with_object({}) do |(k, v), memo|
        memo[converter.convert(k)] = converter.convert(v)
      end
    end
  end
end



describe 'JSON conversions' do
  it 'handles complex structure' do
    input = {
      'students' => ['jozko', 'ferko'],
      'pi' => 3.14,
      'one' => 1,
      'truthy' => true,
      'falsy' => false,
      'nilly' => nil,
      'tree' => {
        'node1' => ['node2', 'node3']
      }
    }

    expect(input.to_json).to eq('{"students" : ["jozko", "ferko"], "pi" : 3.14, "one" : 1, "truthy" : true, "falsy" : false, "nilly" : null, "tree" : {"node1" : ["node2", "node3"]}}')
  end

  it 'handles arrays' do
    input = ['jozko', 'ferko']
    expect(input.to_json).to eq('["jozko", "ferko"]')
  end

  it 'handles strings' do
    expect('jozko'.to_json).to eq('"jozko"')
  end

  it 'handles floats' do
    expect(3.14.to_json).to eq('3.14')
  end

  it 'handles fixnums' do
    expect(1.to_json).to eq('1')
  end

  it 'handles true' do
    expect(true.to_json).to eq('true')
  end

  pending 'strings handle escaping'
end
