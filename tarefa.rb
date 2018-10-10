class Tarefa
  attr_accessor :descricao, :status

  # Podemos passar um valor inicial para status. Dessa forma,
  # ele é opcional no momento da criação. Só há necessidade
  # de usá-lo se queremos criar uma tarefa com status true
  def initialize(descricao, status = false)
    @descricao = descricao
    @status = status
  end

  def to_s
    "#{descricao} - #{status_texto}\n"
  end

  def status_texto
    if status
      'Tarefa concluída!'
    else
      'Não concluída!'
    end
  end
  
end