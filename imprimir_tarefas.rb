require_relative 'prazo.rb'

class ImprimirTarefas
  def self.imprimir(tarefas)
    puts '-'* 75
    tarefas.each_with_index do |tarefa, index|
      prazo = tarefa.prazo
      texto_prazo = prazo != nil ? " - Prazo: #{prazo} dia(s)." : ''
      puts ' - ' + "##{ index+1 } - Tarefa:  #{ tarefa.descricao } " + 
      " - Status: #{ tarefa.status_texto }" + texto_prazo
    end
    puts '-'* 75
    puts
    puts
  end
end