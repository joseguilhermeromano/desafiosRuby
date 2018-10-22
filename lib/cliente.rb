class Cliente
  attr_reader :nome, :sobrenome, :cpf, :nome_completo
  attr_accessor :tratamento
  
  def initialize(nome:, sobrenome:, cpf:)
    @nome = nome
    @sobrenome = sobrenome
    @cpf = cpf
  end

  def nome_completo
    string = "#{nome} #{sobrenome}"
    return  string if tratamento.nil?
    string.insert(0,"#{tratamento} ")
  end
end
