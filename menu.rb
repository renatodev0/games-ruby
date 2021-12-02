require './guess_game.rb'
require './forca.rb'
def ui_menu
  arquivo = "interface_menu.txt"
  texto = File.read(arquivo)
  puts texto
end

ui_menu
game_select = gets.to_i
if game_select == 1
  system "clear"
  ui
  guess_game
  resp = "y"
  while resp == "y" do
    puts "play again?[Y/N]"
    resp = gets.chomp.downcase
    # byebug
    if resp != "y"
      break
    else
      guess_game
    end
  end

elsif game_select == 2
  system "clear"
  ui
  gibbet_game
  resp = "y"
  while resp == "y" do
    puts "play again?[Y/N]"
    resp = gets.chomp.downcase
    # byebug
    if resp != "y"
      break
    else
      gibbet_game
    end
  end
end
