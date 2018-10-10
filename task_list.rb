def menu()
  puts "--- Menu ---"
  puts
  puts "Bem-vindo ao Task List! Escolha uma opção no menu:"
  puts
  puts '[1] Inserir uma tarefa'
  puts '[2] Ver todas as tarefas'
  puts '[3] Buscar Tarefa'
  puts '[4] Alterar o status de uma tarefa'
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
  #tarefas = ['comprar pão', 'comprar leite', 'fazer bolo']
  elementos_encontrados = []
  tarefas.each do |tarefa|
    if tarefa =~ /(?i:#{busca})/
      elementos_encontrados << tarefa
    end
  end
  return elementos_encontrados
end

def add_tarefa(tarefas)
  puts "--- Adicionar Tarefa ---"
  puts 
  print 'Digite sua tarefa: '
  tarefa = Hash.new
  tarefa = {tarefa: gets.strip, status: false}
  tarefas.push(tarefa)
  puts
  status = tarefas.last[:status]
  puts 'Tarefa cadastrada: ' + tarefas.last[:tarefa] + 
  ' Status: ' + status_mensagem(status)
  puts 
end

def exibir_tarefas(tarefas)
  puts "--- Lista de Tarefas ---"
  puts
  tarefas.each_with_index do |tarefa, index|
    puts ' - ' + "##{ index } - Tarefa:  #{ tarefa[:tarefa] } " + 
    " - Status: #{status_mensagem(tarefa[:status])}"
	end
  puts
  puts
end

def status_mensagem(status)
  #status == true ? 'Tarefa concluída!' : 'Tarefa ainda não concluída!'
  return ((status &&= 'Tarefa concluída!')||(status ||= 'Tarefa ainda não concluída!'))
end

def alterar_status(tarefas)
  puts "--- Alterar Status ---"
  puts 
  exibir_tarefas(tarefas)
  print 'Digite o código da tarefa: '
  indice = gets.to_i
  puts 'Escolha uma das opções:'
  puts '1 - Para marcar tarefa concluída.'
  puts '2 - Para marcar tarefa ainda não concluída.'
  puts 
  print 'opção: '
  opcao = gets.to_i
  if opcao != 1 && opcao != 2
    system('clear')
    puts 'opção inválida, tente novamente!'
    alterar_status(tarefas)
  elsif opcao == 1
    tarefas[indice][:status] = true
  else
    tarefas[indice][:status] = false
  end
  puts 
  status = tarefas[indice][:status]
  puts "Tarefa atualizada: " + tarefas[indice][:tarefa] + 
  " Status: " + status_mensagem(status)
  puts
end

def gerar_arquivo(tarefas)
  puts "gerando arquivo..."
  File.open('task.txt', 'w') do |file|
    tarefas.each do |tarefa|
      file.write("#{tarefa[:tarefa]} - #{tarefa[:status]}\n")
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
      tarefa = Hash.new
      string_boolean = line[1]
      status = string_boolean.to_s == "true" ? true : false
      tarefa = {tarefa:line[0], status: status}
      tarefas.push(tarefa)
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
    puts
    puts "Resultado da busca: #{busca(tarefas)}"
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