require 'json'

class Recipe

  attr_accessor :title, :description, :ingredients, 
  :cook_time, :featured

  def initialize(properties)
    @title = properties[:title]
    @description = properties[:description]
    @ingredients = properties[:ingredients]
    @cook_time = properties[:cook_time]
    @featured = properties[:featured]
  end

  def self.from_json(file)
    if File.exist? file
        data = File.read(file)
        data_hash = JSON.parse(data,{:symbolize_names => true})
        object = Recipe.new(data_hash)
    end
    object
  end

end
