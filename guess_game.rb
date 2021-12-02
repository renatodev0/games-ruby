require 'progress_bar'
require 'byebug'

def ui
  puts "Welcome to Guess Game \nQual seu nome?"
  nome = gets
  puts "\n\n"
  puts "Starting the game for You " + nome + "..."
end

def select_number
  puts "Choosing a secret number..."
  bar = ProgressBar.new
  100.times do
    sleep 0.005
    bar.increment!
  end
  puts "\n"
  number = rand(1..100)
  return number
end

def hint
  puts "Guess the correct number"
  hint = gets.to_i
  return hint
end

def win
  arquivo = "guess_game_win.txt"
  texto = File.read(arquivo)
  puts texto
end

def dificulty
  puts "Select dificulty"
  puts "1. Easy"
  puts "2. Medium"
  puts "3. Hard"
  puts "4. Impossible"
  dificulty = gets.to_i
  return dificulty
end



def guess_game
  level = dificulty
  secret_number = select_number
  try = 1
  case level
  when 1
    max_tries = 5
  when 2
    max_tries = 4
  when 3
    max_tries = 3
  when 4
    max_tries = 2
  end

  while try <= max_tries do
    hint_one = hint
    diff = secret_number - hint_one

    maior = hint_one < secret_number
    menor = hint_one > secret_number
    igual = hint_one == secret_number

    if maior
      status = "maior"
    elsif menor
      status = "menor"
    end
    if igual
    begin
        case try
        when 1
          puts "Amazing... Your score is over 8000"
        when 2
          puts "Wow... Your score is 100 points"
        when 3
          puts "Your score is 80 points"
        when 4
          puts "Your score is 30 points"
        when 5
          puts "Your score is 20 points"
        end
       win
       break
    end
    elsif ( -5 <= diff && diff <=5 )
      puts "So close. Try Again, o número secreto é: " + status + "\n"
      try = try + 1
    else
      puts "No, it's wrong. Try Again, o número secreto é: " + status + "\n"
      try = try + 1
    end
  end
end
