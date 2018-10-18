class FileParser
  def to_integer(binary)
    digits = binary.to_s.chars.map(&:to_i)
    potentials = []
    i = 0
    digits.reverse_each do |element|
      potentials << (element * (2**i)) 
      i += 1
    end
    potentials.inject(:+)
  end

  def convert(path_name)
    numbers = []
    if File.exist? path_name
        states_file = File.open(path_name)
        while ! states_file.eof?
          line = states_file.gets.chomp
          numbers << to_integer(line)
        end
    end
    numbers.inject(:+)
  end
end
