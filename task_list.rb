def menu()
  puts "--- Menu ---"
  puts
  puts "Bem-vindo ao Task List! Escolha uma opção no menu:"
  puts
  puts '[1] Inserir uma tarefa'
  puts '[2] Ver todas as tarefas'
  puts '[3] Buscar Tarefa'
  puts '[4] Mudar o status de uma tarefa'
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
  puts 'Tarefa cadastrada: ' + tarefas.last[:tarefa] + ' Status: ' + 
  (tarefas.last[:status] == false && 'Tarefa ainda não realizada!')
  puts 
end

def exibir_tarefas(tarefas)
  puts "--- Lista de Tarefas ---"
  puts
	tarefas.each_with_index do |tarefa, index|
    puts ' - ' + "##{ index } - Tarefa:  #{ tarefa[:tarefa] } " +
    " - Status: #{ tarefa[:status] ||= 'Tarefa ainda não concluída!' || 
    tarefa[:status] &&= 'Tarefa concluída!' }"
	end
  puts
  puts
end

def concluir_tarefa(tarefas)
  puts "--- Concluir Tarefa ---"
  puts 
  exibir_tarefas(tarefas)
  print 'Digite o código da tarefa: '
  indice = gets.to_i
  tarefas[indice][:status] = true
  puts 
  puts "Tarefa atualizada: " + tarefas[indice][:tarefa] + " Status: " + 
  (tarefas[indice][:status] &&= "Tarefa concluída!")
  puts
end


opcao=0
tarefas = []
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
    concluir_tarefa(tarefas)
  when 5
    puts 'Programa encerrado...'
  else
    puts
    puts 'Opção inválida!'
  end
  
end