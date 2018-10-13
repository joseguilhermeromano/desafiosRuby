class ArrayUtils
  def self.multiplos(qtd, multiplo)
    array = []
    1.upto(qtd) do |numero|
      array << numero * multiplo
    end
    array
  end

  def self.tabuada(qtd)
    array = []
    1.upto(10) do |numero|
      array << ArrayUtils.multiplos(10, numero)
      if array.length == qtd 
        break
      end
    end
    array
  end

  def self.ultimo(lista)
    tamanho = lista.length
    lista[tamanho-1]
  end
end
