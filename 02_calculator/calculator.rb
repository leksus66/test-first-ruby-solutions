def add(i, j)
  i + j
end

def subtract(i, j)
  i - j
end

def sum(numbers)
  numbers.inject(0, :+)
end

def multiply(numbers)
  numbers.inject(1, :*)
end

def power(i, j)
  prod = 1
  j.times do
    prod *= i
  end
  
  prod
end

def factorial(i)
  multiply((1..i).to_a)
end
