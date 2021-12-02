require 'ffaker'
require 'progress_bar'
require 'byebug'
require 'faker'
Faker::Config.locale = 'pt-BR'

def ui
  puts "Welcome to Guess Game \nQual seu nome?"
  nome = gets
  puts "\n\n"
  puts "Starting the game for You " + nome + "..."
end

def sort_secret_word
  text = File.read("Lista-de-Palavras.txt")
  all_words = text.split("\n")
  random_number = rand(all_words.size)
  secret_word = all_words[random_number].downcase
  return secret_word
end

def win
  arquivo = "guess_game_win.txt"
  texto = File.read(arquivo)
  puts texto
end


def gibbet_game
  secret_word = sort_secret_word
  errors = 0
  tries = []
  points = 0
  puts "A palavra secreta tem #{secret_word.size} letras"
  while errors < 5 do
    puts "entre com a letra ou palavra"
    try = gets.chomp.downcase
    tries << try
    word_draw = ""
    if try.size == 1
      total_found = 0
      chars = secret_word.size - 1
      position = []

      for i in 0..chars
        letra = secret_word[i]
        if letra == try
          total_found += 1
          position << i
          word_draw += try
        else
          word_draw += "_"
        end
      end
      if total_found == 0
        puts "Letra não encontrada!"
        errors += 1
        points -= 30
      else
        puts "Letra encontrada #{total_found} vezes!"
        points += 30
      end

      puts word_draw
    else
      if try == secret_word
        puts "acertou"
        points += 100
        win
        puts "Você fez #{points} pontos"
        break
      else
        puts "errou"
        errors += 1
        points -= 30
      end
    end
    if errors == 5
      puts secret_word
    end
  end
end
