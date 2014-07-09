require 'minitest/autorun'
require_relative '../lib/from_roman'

class RomanConversions < Minitest::Test
  def test_to_roman
    assert_equal 1, from_roman('I')
    assert_equal 2, from_roman('II')
    assert_equal 3, from_roman('III')
    assert_equal 5, from_roman('V')
    assert_equal 6, from_roman('VI')
    assert_equal 8, from_roman('VIII')
    assert_equal 10, from_roman('X')
    assert_equal 30, from_roman('XXX')
    assert_equal 24, from_roman('XXIV')
    assert_equal 42, from_roman('XLII')
    assert_equal 2014, from_roman('MMXIV')
    assert_equal 1999, from_roman('MCMXCIX')
    assert_equal 666, from_roman('DCLXVI')
    assert_equal 444, from_roman('CDXLIV')

    assert_equal 4, from_roman('IV')
    assert_equal 9, from_roman('IX')
  end
end
