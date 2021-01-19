module NumberHelper
  def format_quantity(number)
    (number % 1).zero? ? number.to_i : number
  end
end
