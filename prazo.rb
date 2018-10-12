require_relative 'tarefa.rb'

class Prazo < Tarefa
  attr_reader :prazo

  def initialize(descricao, status = false, prazo=nil)
    super(descricao,status)
    @prazo = prazo
  end

  def self.nova_tarefa(tarefas)
    puts "--- Adicionar Tarefa ---"
    puts 
    print 'Digite sua tarefa: '
    tarefa_descricao = gets.chomp
    puts "\n\nDeseja estipular um prazo para sua tarefa?"
    puts "1 - Sim.\n2 - Não.\n"
    print "Opção: "
    opcao = gets.to_i
    prazo = nil
    if opcao != 1 && opcao != 2
      puts "Opão inváida! Tente novamente!"
      Prazo.nova_tarefa(tarefas)
    elsif opcao == 1
      print "Informe o prazo em número de dias: "
      prazo = gets.to_i
    end
    tarefas << Prazo.new(tarefa_descricao, false, prazo)
    puts
    puts 'Tarefa cadastrada: ' + tarefa_descricao
    puts 
  end

  def to_s
    if prazo.nil?
      return super.to_s
    end
    super.to_s.chomp + " - #{prazo}\n"
  end


end