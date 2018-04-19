
class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)
  attr_accessor :value , :number
  
  def initialize
    #TO DO doit régler sa valeur, ainsi que son numéro de case
    @value = "X"
    @number = number
  end
  
  def to_s
    #TO DO : doit renvoyer la valeur au format string
  end

end

class Board
  include Enumerable
  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases
  attr_accessor :boardCases

  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
    $z = 0
    @a1 = " "
    @a2 = " "
    @a3 = " "
    @b1 = " "
    @b2 = " "
    @b3 = " "
    @c1 = " "
    @c2 = " "
    @c3 = " "
    @boardCases = [@a1,@b1,@c1,@a2,@b2,@c2,@a3,@b3,@c3]
  end

  def to_s
  #TO DO : afficher le plateau
  puts "    A   B   C"
  puts "1   #{@boardCases[0]} | #{@boardCases[3]} | #{@boardCases[6]} "
  puts "   -----------"
  puts "2   #{@boardCases[1]} | #{@boardCases[4]} | #{@boardCases[7]} "
  puts "   -----------"
  puts "3   #{@boardCases[2]} | #{@boardCases[5]} | #{@boardCases[8]} "

end

  def play
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    x = gets.chomp.upcase.to_s

    if x == "A1"
     x = 0
   elsif x == "A2"
     x = 1
   elsif x == "A3"
     x = 2
   elsif x == "B1"
     x = 3
   elsif x == "B2"
     x = 4
   elsif x == "B3"
     x = 5
   elsif x == "C1"
     x = 6
   elsif x == "C2"
     x = 7
   elsif x == "C3"
     x = 8
   else puts "ce n'est pas un choix valide, recommence"
     return play

   end

   if boardCases[x] == "X" || boardCases[x] == "O"
    puts "La case est déja rempli, choisis en une autre"
    return play
  else 

    if $z % 2 == 0
      boardCases[x] = "X"
    else
      boardCases[x] = "O"
    end
  end
  def victory

    #TO DO : qui gagne ?
    if @boardCases[0] + @boardCases[3] + @boardCases[6] == "OOO" || @boardCases[1] + @boardCases[4] + @boardCases[7] == "OOO" || @boardCases[2] + @boardCases[5] + @boardCases[8] == "OOO"|| @boardCases[0] + @boardCases[4] + @boardCases[8] == "OOO" || @boardCases[2] + @boardCases[4] + @boardCases[6] == "OOO" || @boardCases[0] + @boardCases[1] + @boardCases[2] == "OOO" || @boardCases[3] + @boardCases[4] + @boardCases[5] == "OOO" || @boardCases[6] + @boardCases[7] + @boardCases[8] == "OOO"  
      puts "bravo #{@name2} tu as gagné!!!"
      puts "Tapes Oui pour rejouer"
      g = gets.chomp.downcase
      if g == "oui"
        Game.new.go
      else
        exit
      end

    elsif @boardCases[0] + @boardCases[3] + @boardCases[6] == "XXX" || @boardCases[1] + @boardCases[4] + @boardCases[7] == "XXX" || @boardCases[2] + @boardCases[5] + @boardCases[8] == "XXX"|| @boardCases[0] + @boardCases[4] + @boardCases[8] == "XXX" || @boardCases[2] + @boardCases[4] + @boardCases[6] == "XXX" || @boardCases[0] + @boardCases[1] + @boardCases[2] == "XXX" || @boardCases[3] + @boardCases[4] + @boardCases[5] == "XXX" || @boardCases[6] + @boardCases[7] + @boardCases[8] == "XXX"  
      puts "bravo #{@name1} tu as gagné!!!"   
      puts "Tapes Oui pour rejouer"
      g = gets.chomp.downcase
          if g == "oui"
          Game.new.go
          else
          exit
          end
        else
        $z += 1      

      end
    end
  end
end

class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
  attr_accessor :name ,:value
  attr_writer :win
  
  def initialize
    #TO DO : doit régler son nom, sa valeur, son état de victoire
    @player1 = player1.new
    @player2 = player2.new  
    @player1.name = @name1
    @player1.value = "O"
    @player2.name = @name2
    @player2.value = "X"
  end
end

class Game
  def initialize
    #TO DO : créé 2 joueurs, créé un board
    puts "###### Tic Tac Toe ######"
    @boardCases = Board.new
    puts "Quel est ton prénom joueur 1? "
    @name1 = gets.chomp.capitalize
    puts "Quel est ton prénom joueur 2? "
    @name2 = gets.chomp.capitalize
    @boardCases.to_s
    
    turn    
  end

  def go
    # TO DO : lance la partie
  end

  def turn
    if $z == 0
      puts "#{@name1} à toi de commencer, choisis une case"
    elsif $z > 8
      puts "c'est un match nul"
      puts "Tapes Oui pour rejouer"
      g = gets.chomp.downcase
      if g == "oui"
        Game.new.go
      else
        exit
      end


    elsif $z % 2 == 0 
      puts "#{@name1} à toi de commencer, choisis une case: "
    else
      puts "#{@name2} à toi de jouer, choisis une case"
    end
    @boardCases.play
    @boardCases.to_s
    @boardCases.victory
    turn
    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas fini
  end

end

Game.new.go