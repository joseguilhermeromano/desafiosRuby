class FileParser
  def to_binary(decimal)
    decimal.to_i.to_s(2)
  end

  def to_binary_file(decimal_numbers)
    file = "data/data.txt"
    binarys = decimal_numbers.split(";").map{|e| to_binary(e)}

    if not File.exist? file
       File.new file
    end

    File.open(file, 'w+') do |f|
        f.puts binarys
    end
  end
end
