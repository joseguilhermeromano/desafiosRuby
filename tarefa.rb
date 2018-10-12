
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

  def self.buscar(tarefas)
    puts "--- Buscar Tarefa ---"
    puts
    print 'Digite sua busca: '
    busca = gets.strip
    puts
    puts '--- Resultados ---'
    puts
    elementos_encontrados = []
    tarefas.each do |tarefa|
      if tarefa.descricao =~ /(?i:#{busca})/
        elementos_encontrados << tarefa
      end
    end
    ImprimirTarefas.imprimir(elementos_encontrados)
  end

  def marcar_como_concluida
    @status = true
  end

  def self.concluir_tarefa(tarefas)
    puts "--- Concluir Tarefa ---"
    puts 
    ImprimirTarefas.imprimir(tarefas)
    print 'Digite o código da tarefa: '
    indice = gets.to_i
    tarefas[indice-1].marcar_como_concluida
    puts 
    puts "Tarefa marcada como concluída!"
    puts
  end

  def self.carregar_lista(tarefas)
    puts "carregando lista de tarefas..."
    if File.exist? 'task.txt'
      states_file = File.open('task.txt')
      while ! states_file.eof?
        line = states_file.gets.chomp.split(" - ")
        status = line[1] == "Tarefa concluída!" ? true : false;
        prazo = line.length == 3 ? line[2] : nil
        tarefas << Prazo.new(line[0], status, prazo)
      end
      states_file.close
      puts "Lista carregada com sucesso!"
      puts
    else
    puts "Não há tarefas cadastradas!"
    puts
    end
  end

  def self.gerar_arquivo(tarefas)
    puts "gerando arquivo..."
    File.open('task.txt', 'w') do |file|
      tarefas.each do |tarefa|
        file.write(tarefa.to_s)
      end
    end
    puts "O arquivo foi gerando com sucesso..."
  end

  private

  attr_writer :status
  
end