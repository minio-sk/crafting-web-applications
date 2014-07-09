require 'minitest/autorun'
require_relative '../lib/to_roman'

class RomanConversions < Minitest::Test
  def test_to_roman
    assert_equal 'I', to_roman(1)
    assert_equal 'II', to_roman(2)
    assert_equal 'III', to_roman(3)
    assert_equal 'V', to_roman(5)
    assert_equal 'VI', to_roman(6)
    assert_equal 'VIII', to_roman(8)
    assert_equal 'X', to_roman(10)
    assert_equal 'XXX', to_roman(30)
    assert_equal 'XXIV', to_roman(24)
    assert_equal 'XLII', to_roman(42)
    assert_equal 'MMXIV', to_roman(2014)
    assert_equal 'MCMXCIX', to_roman(1999)
    assert_equal 'DCLXVI', to_roman(666)
    assert_equal 'CDXLIV', to_roman(444)

    assert_equal 'IV', to_roman(4)
    assert_equal 'IX', to_roman(9)
  end
end
