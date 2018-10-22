require 'conta.rb'
class ContaCorrente < Conta
  def initialize(numero:, titular:, saldo:, limite:)
    super(numero: numero, titular: titular,
          saldo: saldo, limite: limite)
  end

  def depositar(valor_deposito)
    super(valor_deposito - 0.10)
  end
end