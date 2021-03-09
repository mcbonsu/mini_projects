
def prompt(message)
    puts ("=> #{message}")
end

def add_newline
puts
end

def clear_screen
    system('clear') || system('cls')
end

add_newline
prompt("WELCOME TO NUMBER GUESSING GAME")
add_newline

def game_max_num
    num = ''
    loop do
         prompt("Enter a positive number between 20 and 100")
        num =  gets.chomp.to_i

        break unless (num < 20 || num > 100)
        prompt("Invalid Entry. Enter a positive numbers between 20 and 100")
        add_newline
    end
    return num
end

player_guessed_numbers = []
first = ''
loop do
    n = 1
    game_array = (1..game_max_num).to_a
    winning_numbers = game_array.sample(5)

    last_num = game_array[game_array.length - 1]

    while n <= 5

        if n == 1
            first = "st"
        elsif n == 2
            first = "nd"
        elsif n == 3
            first = "rd"
        else
            first = "th"
        end

        prompt("Enter your #{n}#{first} guess for the winning numbers: ")
        rund_num = gets.chomp.to_i

        if (rund_num == 0 || rund_num < 1)
            prompt("Invalid Entry. Enter a positive number from 1 to #{last_num}")
        elsif (rund_num > last_num)
            prompt("Too big. Enter a positive number from 1 to #{last_num}")
        else
            rund_num <= last_num
            player_guessed_numbers.push(rund_num)
            n += 1
        end
    end
    add_newline

    if ((winning_numbers & player_guessed_numbers).any?)
        prompt("Excellent!. One or more of your entries matches with game winning numbers!")
        add_newline
        prompt("You entered #{player_guessed_numbers}")
        prompt("Winning Numbers are: #{winning_numbers}")
    else
        prompt("You lost!. Sorry, None of your entries matches with the game winning numbers")
        add_newline
        prompt("You entered #{player_guessed_numbers}")
        prompt("Winning Numbers: #{winning_numbers}")
    end
    add_newline

    prompt("Would you like to play again? (Enter Y for YES or N for NO)")
    answer = gets.chomp

    break unless answer.downcase().start_with?('y')
    player_guessed_numbers.clear()
    clear_screen
end
add_newline
prompt("Thank you for playing. Seen you again soon!")
