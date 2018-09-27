require 'spec_helper'

describe FileParser do
  let(:file_parser) { FileParser.new }
  let(:file1) { 'data/file1.txt' }
  let(:file2) { 'data/file2.txt' }

  it 'converte binario para inteiro' do
    expect(file_parser.to_integer('1100100')).to eq 100
  end

  it 'converte outro binario para inteiro' do
    expect(file_parser.to_integer('11001000')).to eq 200
  end

  it 'converte arquivo binario e soma os números' do
    expect(file_parser.convert(file1)).to eq 5500
  end

  it 'converte outro arquivo binario e soma os números' do
    expect(file_parser.convert(file2)).to eq 1202
  end

  it 'converte string de números para arquivo de binários' do
    file_parser.to_binary_file('100;200;300;400')
    expect(File.read('data/data.txt')).to include(
      "1100100\n11001000\n100101100\n110010000")
  end

  it 'converte string de números para arquivo de binários' do
    file_parser.to_binary_file('299;300;301;302')
    expect(File.read('data/data.txt')).to include(
      "100101011\n100101100\n100101101\n100101110")
  end
end
