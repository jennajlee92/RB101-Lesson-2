def prompt(message)
  p "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

prompt("Welcome to the Loan Calculator!")
prompt("-------------------------------")

loop do
  principal = ''
  loop do
    prompt("What is the amount you'd like to borrow, in USD?")
    principal = gets.chomp

    if integer?(principal)
      break
    else
      prompt("Woops! We need a valid amount.")
    end
  end

  apr = ''
  loop do
    prompt("What is the Annual Percentage Rate (APR) in %?")
    apr = gets.chomp

    if integer?(apr)
      break
    else
      prompt("Woops! We need a valid percent.")
    end
  end

  dur_in_years = ''
  loop do
    prompt("What is the loan duration in years?")
    dur_in_years = gets.chomp

    if integer?(dur_in_years)
      break
    else
      prompt("Woops! We need the duration in years.")
    end
  end

  month_interest = (apr.to_f / 12)
  month_interest_dec = month_interest / 100
  dur_in_months = dur_in_years.to_i * 12

  monthly_payment = principal.to_i *
                    (month_interest_dec /
                    (1 - (1 + month_interest_dec)**(-dur_in_months)))

  puts("Your monthly interest rate is: #{month_interest}.",
       "Your loan duration in months is: #{dur_in_months}.",
       "Your monthly payment is: #{monthly_payment}.")

  prompt("Would you like to calculate another loan?")
  answer = gets.chomp

  break unless answer.downcase.start_with?("y")
end
