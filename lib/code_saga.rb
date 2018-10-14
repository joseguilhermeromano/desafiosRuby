class CodeSaga
  def code_or_saga(number)
    array = []
    1.upto(number) do |n|
      next array << "CodeSaga" if (n % 3 == 0 and n % 5 == 0)
      next array << "Code" if n % 3 == 0 
      next array << "Saga" if n % 5 == 0 
      array << n
    end
    array
  end
end
