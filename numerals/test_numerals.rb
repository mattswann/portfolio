# #the DT way

# def get(number)

# remaninder = number
# output = []

# table.keys.reverse.each do |k, v|

#   while remainder >= k
#     remainder = remainder - k
#     output << self.lookup(k)
#   end

# end
# output.join('')
# end


# def table
#   lookup = {
#     1 => 'I',
#     4 => 'IV',
#     5 => 'V',
#     9 => 'IX',
#     10 => 'X',
#     40 => 'XL',
#     #etc
#   }
# end








  def numerals(number)

    result = ''

    ones = ['I','II','III','IV','V','VI','VII','VIII','IX']

    tens = ones.map { |str| str.gsub('V','L').gsub('X', 'C').gsub('I','X') }
    hundreds = ones.map { |str| str.gsub('V', 'D').gsub('I','C').gsub('X', 'M') }

    if (100..999) === number
      result = result + hundreds[number/ 100 -1]
      number = number % 100
    end

    if (10..99) === number
      result = result + tens[number/ 10 - 1]
      number = number % 10
    end

    if (1..9) === number
      result = result + ones[number -1]
    end

    result
end


require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new()

describe 'numerals' do

  [
    [5, 'V'],
    [1, 'I'],
    [20, 'XX'],
    [35, 'XXXV'],
    [4, 'IV'],
    [63, 'LXIII'],
    [550, 'DL'],
    [890, 'DCCCXC'],


  ].each do |input, expected|

    it "return #{expected} when #{input} is entered" do
      numerals(input).must_equal expected
    end

  end

end