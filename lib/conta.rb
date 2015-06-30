class Conta
  attr_accessor :titular, :limite, :saldo, :numero
  def initialize(numero: numero, nome: nome, saldo: saldo, limite: limite)
    @numero = numero
    @titular = Cliente.new(nome: nome)
    @saldo = saldo
    @limite = limite
  end

  def sacar(valor)
    return false if valor > (@saldo + @limite)
    @saldo -= valor
  end

  def depositar(valor)
    @saldo += valor
  end

  def no_limite?
    return @saldo < 0
  end

  def ==(other)
    return other.titular.nome == self.titular.nome &&
      other.limite    == self.limite &&
      other.saldo     == self.saldo &&
      other.numero    == self.numero
  end

  def transfere(conta_destino, valor_transferencia)
    conta_destino.saldo += valor_transferencia
    sacar(valor_transferencia)
  end
end
