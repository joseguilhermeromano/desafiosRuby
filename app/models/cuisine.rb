class Cuisine < ApplicationRecord
  validates :name, presence: { message: 'Você deve informar o nome da'\
                                        ' cozinha' }
  has_many :recipes
end
