require 'spec_helper'

describe RomanNumerals do
  let(:roman_numerals) { RomanNumerals.new }

  it 'converts 1..10 to roman' do
    expect(roman_numerals.from_decimal(1)).to eq 'I'
    expect(roman_numerals.from_decimal(4)).to eq 'IV'
    expect(roman_numerals.from_decimal(5)).to eq 'V'
    expect(roman_numerals.from_decimal(9)).to eq 'IX'
    expect(roman_numerals.from_decimal(10)).to eq 'X'
  end

  it 'convert 10..100 to roman_numerals' do
    expect(roman_numerals.from_decimal(22)).to eq 'XXII'
    expect(roman_numerals.from_decimal(40)).to eq 'XL'
    expect(roman_numerals.from_decimal(50)).to eq 'L'
    expect(roman_numerals.from_decimal(84)).to eq 'LXXXIV'
    expect(roman_numerals.from_decimal(100)).to eq 'C'
  end

  it 'convert 100..500 to roman_numerals' do
    expect(roman_numerals.from_decimal(256)).to eq 'CCLVI'
    expect(roman_numerals.from_decimal(300)).to eq 'CCC'
    expect(roman_numerals.from_decimal(400)).to eq 'CD'
    expect(roman_numerals.from_decimal(412)).to eq 'CDXII'
    expect(roman_numerals.from_decimal(500)).to eq 'D'
  end

  it 'convert 500..1000 to roman_numerals' do
    expect(roman_numerals.from_decimal(589)).to eq 'DLXXXIX'
    expect(roman_numerals.from_decimal(750)).to eq 'DCCL'
    expect(roman_numerals.from_decimal(890)).to eq 'DCCCXC'
    expect(roman_numerals.from_decimal(989)).to eq 'CMLXXXIX'
    expect(roman_numerals.from_decimal(1000)).to eq 'M'
  end

  it 'convert 1000..4000 to roman_numerals' do
    expect(roman_numerals.from_decimal(1200)).to eq 'MCC'
    expect(roman_numerals.from_decimal(1500)).to eq 'MD'
    expect(roman_numerals.from_decimal(2500)).to eq 'MMD'
    expect(roman_numerals.from_decimal(3789)).to eq 'MMMDCCLXXXIX'
    expect(roman_numerals.from_decimal(3999)).to eq 'MMMCMXCIX'
  end
end
