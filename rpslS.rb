VALID_CHOICES = %w(r p s l S)
rpslS = {r: 'rock', p: 'paper', s: 'scissors', l: 'lizard', S: 'Spock'}
winning_hand = { r: {s: 'scissors', l: 'lizard'}, p: {r: 'rock', S: 'Spock'},
                 s: {p: 'paper', l: 'lizard'}, l: {p: 'paper', S: 'Spock'},
                 S: {r: 'rock', s: 'scissors'}}

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

  prompt("Computer is choosing...")
  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{rpslS[user_choice.to_sym]}; Computer chose: #{rpslS[computer_choice.to_sym]}")

  if winning_hand[user_choice.to_sym][computer_choice.to_sym]
    prompt("You won!")
  elsif winning_hand[computer_choice.to_sym][user_choice.to_sym]
    prompt("Computer won.")
  else
    prompt("It's a tie.")
  end

  prompt("Play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
