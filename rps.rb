VALID_CHOICES = %w(r p s)
rps = {r: 'rock', p: 'paper', s: 'scissors'}

def prompt(message)
  puts "=> #{message}"
end

prompt("Welcome to Rock, Paper, Scissors!")
prompt("---------------------------------")

loop do
  user_choice = ''
  loop do
    prompt("Choose rock, paper, or scissors: r, p, s")
    user_choice = gets.chomp

    if VALID_CHOICES.include?(user_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  prompt("Computer is choosing...")
  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{rps[user_choice.to_sym]}; Computer chose: #{rps[computer_choice.to_sym]}")

  if user_choice == 'r'
    case computer_choice
    when 'r'
      prompt("It's a tie.")
    when 'p'
      prompt("Computer won.")
    when 's'
      prompt("You won!")
    end
  elsif user_choice == 'p'
    case computer_choice
    when 'r'
      prompt("You won!")
    when 'p'
      prompt("It's a tie.")
    when 's'
      prompt("Computer won.")
    end
  else
    case computer_choice
    when 'r'
      prompt("Computer won.")
    when 'p'
      prompt("You won!")
    when 's'
      prompt("It's a tie.")
    end
  end

  prompt("Play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
