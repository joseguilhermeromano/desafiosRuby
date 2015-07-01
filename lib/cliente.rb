class Cliente
  attr_reader :nome, :sobrenome, :cpf
  attr_writer :tratamento

  def initialize(nome: nome, cpf: cpf, sobrenome: sobrenome)
    @nome = nome
    @cpf = cpf
    @sobrenome = sobrenome
  end

  def nome_completo
    if tratamento
      "#{tratamento} #{nome} #{sobrenome}"
    else
      "#{nome} #{sobrenome}"
    end
  end

  def tratamento
    @tratamento
  end
end
