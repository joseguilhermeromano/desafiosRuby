class Fibonacci
  
  def element(n)
    if n <= 1
      return n
    end
    return element(n-1) + element(n-2)
  end

  def elements(n)
    elements = []
    0.upto(n) do |number|
      elements << element(number)
    end
    elements
  end

end
