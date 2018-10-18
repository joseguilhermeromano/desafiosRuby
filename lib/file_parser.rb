class FileParser
  def to_integer(binary)
    binary.to_i(2)
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
