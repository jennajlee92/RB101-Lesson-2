VALID_CHOICES = %w(r p s l S)

rpsls = { r: 'rock', p: 'paper', s: 'scissors', l: 'lizard', S: 'Spock' }

winning_hand = { r: { s: 'scissors', l: 'lizard' }, p: { r: 'rock', S: 'Spock' },
                 s: { p: 'paper', l: 'lizard' }, l: { p: 'paper', S: 'Spock' },
                 S: { r: 'rock', s: 'scissors' } }

number_of_wins = { user: 0, computer: 0 }

def prompt(message)
  puts "=> #{message}"
end

prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
prompt("------------------------------------------------")

loop do
  user_choice = ''
  loop do
    prompt("Choose rock, paper, scissors, lizard, Spock: r, p, s, l, S")
    user_choice = gets.chomp

    if VALID_CHOICES.include?(user_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{rpsls[user_choice.to_sym]}; Computer chose: #{rpsls[computer_choice.to_sym]}")

  if winning_hand[user_choice.to_sym][computer_choice.to_sym]
    prompt("You won!")
    number_of_wins[:user] += 1
  elsif winning_hand[computer_choice.to_sym][user_choice.to_sym]
    prompt("Computer won.")
    number_of_wins[:computer] += 1
  else
    prompt("It's a tie.")
    number_of_wins[:user] += 1
    number_of_wins[:computer] += 1
  end

  prompt("Your wins: #{number_of_wins[:user]}. Computer wins: #{number_of_wins[:computer]}.")

  answer = ''

  if number_of_wins[:user] == 3 || number_of_wins[:computer] == 3
    if number_of_wins[:user] == 3
      prompt("That's a match! You won!")
    elsif number_of_wins[:computer] == 3
      prompt("That's a match! The computer won.")
    else
      prompt("Match and tie!")
    end

    prompt("Play again? (y/n)")
    answer = gets.chomp
  end

  break if answer.downcase.start_with?('n')
end

prompt("Thank you for playing. Goodbye!")
