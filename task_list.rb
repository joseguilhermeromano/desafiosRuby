def menu()
  puts "Bem-vindo ao Task List! Escolha uma opção no menu: \n"
  puts '[1] Inserir uma tarefa'
  puts '[2] Ver todas as tarefas'
  puts '[3] Buscar Tarefa'
  puts '[4] Sair'
  puts
  print 'Opção escolhida: '
  gets.to_i
end

def busca()
  print 'Digite sua busca: '
  busca = gets.strip
  tarefas = ['comprar pão', 'comprar leite', 'fazer bolo']
  elementos_encontrados = []
  tarefas.each do |tarefa|
    if tarefa.include? busca
      elementos_encontrados << tarefa
    end
  end
  return elementos_encontrados
end


opcao=0
tarefas = []
while opcao != 4 do
  
  opcao = menu()
  system('clear')
  case opcao
  when 1
    print 'Digite sua tarefa: '
    tarefas.push(gets)
    puts
    puts 'Tarefa cadastrada: ' + tarefas . last
  when 2
    puts
    #puts tarefas
	j = 0
	tarefas.each_with_index do |tarefa, index|
	j += 10
	  #redo unless index % 10 == 0
	  print ' - ' + "##{ j + index } - #{ tarefa }" . strip
	end
	puts
  when 3
    puts
    puts "Resultado da busca: #{busca()}"
  when 4
    puts 'Programa encerrado...'
  else
    puts
    puts 'Opção inválida!'
  end
  
end