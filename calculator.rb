Kernel.puts("Welcome to Calculator!")
Kernel.puts("Input a number:")
num1 = Kernel.gets().chomp()
Kernel.puts("Input another number:")
num2 = Kernel.gets().chomp()
Kernel.puts("What operation do you want to perform on these numbers? (+ - / *)")
op = Kernel.gets().chomp()

unless op == "+" || op == "-" || op == "/" || op == "*"
  Kernel.puts("Oops! Not a valid operation. Try again.")
end

case op
when "+"
  result = num1.to_i + num2.to_i
when "-"
  result = num1.to_i - num2.to_i
when "/"
  result = num1.to_f / num2.to_f
when "*"
  result = num1.to_i * num2.to_i
end

Kernel.puts("#{num1} #{op} #{num2} equals #{result}.")