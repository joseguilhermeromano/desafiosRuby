class Car
  attr_accessor :manufacturer, :model, :year
  
  def initialize (manufacturer, model, year)
    @manufacturer = manufacturer
    @model = model
    @year = year
  end

  #Getter
#   def model
#     return @model 
#   end


  # Setter
  # Sim! Em Ruby podemos declarar métodos com =
#   def model=(value)
#     @model = value
#   end

end

car = Car.new('Toyota', 'Corolla', 2018)