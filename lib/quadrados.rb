class Quadrados
  attr_accessor :valor
  def initialize(valor)
    @valor = valor
  end

  def quadrado_da_soma
    soma = 0
    count = 1
    i = 2
    while count <= valor do 
      if is_primo(i)
        soma += i
        count += 1
      end
      i += (not i.odd?) ? 1 : 2
    end
    soma ** 2
  end

  def soma_dos_quadrados
    soma = 0
    count = 0
    i = 2
    while count < valor do 
      if is_primo(i)
        soma += i ** 2
        count += 1
      end
      i += (not i.odd?) ? 1 : 2
    end
    soma
  end

  def diferenca
    quadrado_da_soma - soma_dos_quadrados
  end

  def is_primo(n)
    primeiros_primos = [2,3,5,7,11,17]

    if primeiros_primos.include? n
      return true
    end

    if (n == 1 or not n.odd?)
      return false
    end

    digitos = n.to_s.chars.map(&:to_i)
    soma_digitos = digitos.inject(:+)
    ultimo_d = digitos[-1]

    if (soma_digitos % 3 == 0 or ultimo_d == 0 or ultimo_d == 5)
      return false
    end
    
    verificador = false
    x = 2
    loop do
      break if n % x == 0
      break verificador = true if (n % x != 0 and (n/x) < x)
      x += (not x.odd?) ? 1 : 2
    end
    return verificador
  end
end