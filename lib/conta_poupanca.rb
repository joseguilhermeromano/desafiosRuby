require 'conta.rb'

class ContaPoupanca < Conta
  def initialize(numero:, titular:, saldo:)
  super(numero: numero, titular: titular,
        saldo: saldo)
  end

  def atualizar(juros)
    super(@saldo * (1 + juros))
  end
end