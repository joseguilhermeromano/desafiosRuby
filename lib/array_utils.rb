class ArrayUtils
  def self.compara(lista1, lista2)
    if (lista1.length-1) != (lista2.length-1)
      return false
    end

    (lista1 & lista2).empty?
    
    (lista1 - lista2).empty?

  end

  def self.divisiveis(divisivel1,divisivel2)
    array = []
    array_divisiveis_1e2 = []
    array_apenas_divisivel1 = []
    array_apenas_divisivel2 = []
    0.upto(50) do |numero|
      if numero != 0
        if (numero % divisivel1 == 0) && (numero % divisivel2 == 0)
          array_divisiveis_1e2 << numero
        elsif numero % divisivel1 == 0
          array_apenas_divisivel1 << numero
        elsif numero % divisivel2 == 0
          array_apenas_divisivel2 << numero
        end
      end
    end
    array << array_divisiveis_1e2
    array << array_apenas_divisivel1
    array << array_apenas_divisivel2
    array
  end

  def self.soma(list)
    list.inject(:+)
  end

  def self.combinar(numeros,letras)
    array1 = []
    numeros.each do |numero|
      letras.each do |letra|
        array2 = []
        array2 << numero << letra
        array1 << array2
      end
    end
    array1
  end
end
