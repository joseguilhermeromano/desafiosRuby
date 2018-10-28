class Recipe < ApplicationRecord
  validates :title, :recipe_type, :cuisine, :difficulty, 
            :cook_time, :ingredients, :cook_method, 
            presence: true
  validate :must_fill_in_all_fields

  def must_fill_in_all_fields
    fields = [title, recipe_type, cuisine, difficulty, 
              cook_time, ingredients, cook_method]
    if not fields.all?
      self.errors[:base] << "Você deve informar todos os dados da receita"
    end
  end
  
  def cook_time_min
    "#{cook_time} minutos"
  end
end
