class Arrays

  def self.converte_impares_por(lista, numero)
    array = []
    array << lista.reject{|num| num.even?}
    array << array[0].map{|num| num *= numero}
  end

  def self.converte_pares_por(lista, numero)
    array = []
    array << lista.reject{|num| num.odd?}
    array << array[0].map{|num| num *= numero}
  end

end
