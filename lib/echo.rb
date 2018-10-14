class Echo
  def message(frase)
    if frase.gsub(/\s+/, "").empty?
      "Nada?"
    elsif frase[-1] == "?"
      "Só faço echo, não respondo perguntas."
    elsif frase =~ /^[ \p{Uppercase} [:punct:]]+$/
      "Não faço echo de gritos."
    else
      frase
    end
  end
end
