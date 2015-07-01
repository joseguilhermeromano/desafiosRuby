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
    @saldo < 0
  end

  def ==(other)
    other.titular.nome == titular.nome &&
      other.limite == limite &&
      other.saldo  == saldo &&
      other.numero == numero
  end

  def transfere(conta_destino, valor_transferencia)
    conta_destino.saldo += valor_transferencia
    sacar(valor_transferencia)
  end
end
