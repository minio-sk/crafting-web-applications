ARABIC = {
  'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50,
  'C' => 100, 'D' => 500, 'M' => 1000
}

def from_roman(roman)
  chars = roman.chars.to_a << 'I'
  chars.each_cons(2).inject(0) do |sum, (c1, c2)|
    sum + (ARABIC[c1] < ARABIC[c2] ? -ARABIC[c1] : ARABIC[c1])
  end
end

