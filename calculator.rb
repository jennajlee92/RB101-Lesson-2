require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'es'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

answer = nil
op = nil
num1 = nil
num2 = nil
name = ''

loop do
  prompt('welcome')
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    prompt("Hi, #{name}!")
    break
  end
end

loop do # main execution
  loop do
    prompt("Input a number:")
    num1 = Kernel.gets().chomp()

    if num1.to_i.to_s == num1
      break
    else
      prompt("That's not a valid number!")
    end
  end

  loop do
    prompt("Input another number:")
    num2 = Kernel.gets().chomp()

    if num2.to_i.to_s == num2
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
