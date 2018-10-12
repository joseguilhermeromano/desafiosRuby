#puts 'Meu nome é José Guilherme Romano.'
#puts 'Tenho 22 anos.'
#puts 'Moro em Guarulhos-SP.'
#puts ''
#puts 'Adeus...'

print "Digite seu nome:"
nome=gets.strip
print "Sua idade é:"
idade=gets.to_i
puts "\nSeu nome é " + nome + "."
puts "Sua idade é #{idade}."

if idade == 18 
  puts 'Você está apto a tirar a habilitação!'
  else if idade > 18
    puts 'Você está apto a dirigir!'
  else
    puts 'Você não está apto a dirigir!'
  end
end