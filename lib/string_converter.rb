 require 'active_support/all'

 class StringConverter
  @@accent_entities = { 'àèìòù'  => '&grave;', 
                        'áéíóúý' => '&acute;',
                        'âêîôû'  => '&circ;',
                        'ãõñ'     => '&tilde;',
                        'äëïöüÿ' => '&uml;',
                        'ç'      => '&cedil;',
                        '&'      => '&amp;'} 

  def self.remove_accent(character)
    character.mb_chars.normalize(:kd).gsub(/\p{Mn}/, '')
  end

  def self.get_character_with_accent(html_entity, character)
    character_accented = ''
    html_entity_2 = String.new(html_entity)
    html_entity_2[1] = ''
    @@accent_entities.each do |k,e|
      if e == html_entity
        character_accented = k
        break
      elsif e == html_entity_2
        position = remove_accent(k).rindex(character.downcase)
        character_accented = k[position]
        break
      end
    end
    character_accented
  end

  def self.convert_to_iso8859_1(phrase)
    string_convert = '' 
    phrase.split('').each do |c| 
      html_entity = ''
      not_accent = remove_accent(c)
      @@accent_entities.each do |k,e|
        break html_entity = e if not_accent == k
        break html_entity = String.new(e).insert(1, not_accent)  if k.include? c.downcase 
      end
      string_convert +=  (!html_entity.empty? ? html_entity : c)
    end
    string_convert
  end

  def self.convert_to_human(phrase) 
    html_entities = phrase.scan(/&.*?;/)
    html_entities.each do |html_entity|
      character = html_entity[1]
      character_accented = get_character_with_accent(html_entity, character)
      
      if /[[:upper:]]/.match(character)
        character_accented.upcase
      end
      
      phrase = phrase.gsub(html_entity, character_accented)
    end
    phrase
  end
  
  private_class_method :remove_accent, :get_character_with_accent
end
