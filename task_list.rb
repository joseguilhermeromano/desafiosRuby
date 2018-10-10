require_relative 'Tarefa.rb'

def menu()
  puts "--- Menu ---"
  puts
  puts "Bem-vindo ao Task List! Escolha uma opção no menu:"
  puts
  puts '[1] Inserir uma tarefa'
  puts '[2] Ver todas as tarefas'
  puts '[3] Buscar Tarefa'
  puts '[4] Concluir Tarefa'
  puts '[5] Sair'
  puts
  print 'Opção escolhida: '
  gets.to_i
end

def busca(tarefas)
  puts "--- Buscar Tarefa ---"
  puts
  print 'Digite sua busca: '
  busca = gets.strip
  elementos_encontrados = []
  tarefas.each do |tarefa|
    if tarefa.descricao =~ /(?i:#{busca})/
      puts "Tarefa: #{ tarefa.descricao } - Status: #{ tarefa.status_texto }"
    end
  end
end

def add_tarefa(tarefas)
  puts "--- Adicionar Tarefa ---"
  puts 
  print 'Digite sua tarefa: '
  tarefa_descricao = gets.chomp
  tarefas << Tarefa.new(tarefa_descricao)
  puts
  puts 'Tarefa cadastrada: ' + tarefa_descricao
  puts 
end

def exibir_tarefas(tarefas)
  puts "--- Lista de Tarefas ---"
  puts
  tarefas.each_with_index do |tarefa, index|
    puts ' - ' + "##{ index } - Tarefa:  #{ tarefa.descricao } " + 
    " - Status: #{ tarefa.status_texto }"
	end
  puts
  puts
end

def alterar_status(tarefas)
  puts "--- Concluir Tarefa ---"
  puts 
  exibir_tarefas(tarefas)
  print 'Digite o código da tarefa: '
  indice = gets.to_i
  tarefas[indice].status = true
  puts 
  puts "Tarefa marcada como concluída!"
  puts
end

def gerar_arquivo(tarefas)
  puts "gerando arquivo..."
  File.open('task.txt', 'w') do |file|
    tarefas.each do |tarefa|
      file.write(tarefa.to_s)
    end
  end
  puts "O arquivo foi gerando com sucesso..."
end

def carregar_lista(tarefas)
  puts "carregando lista de tarefas..."
  if File.exist? 'task.txt'
    states_file = File.open('task.txt')
    while ! states_file.eof?
      line = states_file.gets.chomp.split(" - ")
      status = line[1] == "Tarefa concluída!" ? true : false;
      tarefas << Tarefa.new(line[0], status)
    end
    states_file.close
    puts "Lista carregada com sucesso!"
    puts
  else
  puts "Não há tarefas cadastradas!"
  puts
  end
end


opcao=0
tarefas = []
carregar_lista(tarefas)
while opcao != 5 do
  opcao = menu()
  system('clear')
  case opcao
  when 1
    add_tarefa(tarefas)
  when 2
    exibir_tarefas(tarefas)
  when 3
    busca(tarefas)
    puts
  when 4
    alterar_status(tarefas)
  when 5
    gerar_arquivo(tarefas)
    puts 'Programa encerrado...'
  else
    puts
    puts 'Opção inválida!'
  end
  
end