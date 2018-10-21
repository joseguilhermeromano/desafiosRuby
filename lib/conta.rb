require 'cliente.rb'

class Conta
  attr_accessor :numero, :titular, :saldo, :limite
  
  def initialize(numero:, titular:, saldo:, limite:)
    @numero = numero
    @titular = Cliente.new(titular)
    @saldo =  saldo
    @limite = limite 
  end

  def sacar(valor_saque)
    if pode_sacar_ou_transferir? valor_saque
      @saldo -= valor_saque
    end
    false
  end

  def pode_sacar_ou_transferir? valor
    saldo_total = saldo + limite
    (saldo_total.to_f > valor) 
  end

  def no_limite?
    saldo.to_f < 0 and saldo.to_f <= limite
  end

  def depositar(valor_deposito)
    @saldo += valor_deposito
  end

  def == outra_conta
    (self.numero       == outra_conta.numero       and
     self.titular.nome == outra_conta.titular.nome and
     self.saldo        == outra_conta.saldo        and
     self.limite       == outra_conta.limite)
  end

  def transfere(conta_destino, valor_transferencia)
    if pode_sacar_ou_transferir? valor_transferencia
      @saldo -= valor_transferencia
      conta_destino.saldo += valor_transferencia
    end
    false
  end
end
