def prompt(message)
  Kernel.puts("=> #{message}")
end

answer = nil
op = nil
num1 = nil
num2 = nil

prompt("Welcome to Calculator!")

loop do
loop do
  prompt("Input a number:")
  num1 = Kernel.gets().chomp()

  if num1.to_i != 0
    break
  else
    prompt("That's not a valid number!")
  end
end

loop do
  prompt("Input another number:")
  num2 = Kernel.gets().chomp()

  if num2.to_i != 0
    break
  else
    prompt("That's not a valid number!")
  end
end

loop do
  prompt("What operation do you want to perform on these numbers? (+ - / *)")
  op = Kernel.gets().chomp()

  if op == "+" || op == "-" || op == "/" || op == "*"
    break
  else
    prompt("That's not a valid operation!")
  end
end

result = case op
when "+"
  num1.to_i + num2.to_i
when "-"
  num1.to_i - num2.to_i
when "/"
  num1.to_f / num2.to_f
when "*"
  num1.to_i * num2.to_i
end

Kernel.puts("#{num1} #{op} #{num2} equals #{result}.")

loop do
  prompt("Do you want to perform another operation? (y/n)")
  answer = Kernel.gets().chomp()

  if answer == 'y' || answer == 'n'
    break
  else
    prompt("That's not a valid answer!")
  end
end

if answer == 'n'
  break
end

end