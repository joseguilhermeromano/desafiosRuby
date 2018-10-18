class FileParser
  def to_integer(binary)
    binary.to_i(2)
  end

  def convert(path_name)
    sum = 0
    if File.exist? path_name
        data = File.read(path_name)
        data.each_line do |line|
          sum += to_integer(line)
        end
    end
    sum
  end
end
