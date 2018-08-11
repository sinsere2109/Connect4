class Connect4
#initialize game, display board and start game
def initialize
		@board= 
		[
		[" ", " ", " ", " ", " ", " ", " "],
		[" ", " ", " ", " ", " ", " ", " "],
		[" ", " ", " ", " ", " ", " ", " "],
		[" ", " ", " ", " ", " ", " ", " "],
		[" ", " ", " ", " ", " ", " ", " "],
		[" ", " ", " ", " ", " ", " ", " "]
		]
	
		@count=0
		@position=[]
		display
		play
    end

#start game
def play
loop do  #allow the players to alternate turns while there is no winner
player_turn
if isWinner
puts "#{turn} wins! "  #if a winner exists, end game and display winner
 break
	end
  end
end
		
#display board
def display
	for i in 0..@board.length-1
		for j in 0..@board[0].length-1
			print "| #{@board[i][j]}"
		end
			print "|"
			puts"\n"
	end
end		

#Get user column 
def user_choice
puts "It is #{@count.even? ? pMark= "X" : pMark = "O"} turn." #check if @count is odd or even to determine X or O turn
puts "Pick a column to play. (1-7)"
answer=gets.chomp
end	

#Set X or O on board and return the current position 	
def set_marker(pMark,column)
column=column-1
x=@board.length-1
until @board[x][column] == " "
x-=1
end
@board[x][column]=pMark
[x,column]
end

#Player's choice validation and set position 
def player_move(pMark)
column=0
until column>0 && column <8
column=user_choice.to_i
end
@position=set_marker(pMark,column)
end	

#Returns whose turn it is
def turn
@count.even? ? pMark= "O" : pMark = "X" 
end

def player_turn
pMark=@count.even? ? marker = "X" : marker = "O"
player_move(pMark)
puts "Board:"
display
@count +=1
end

#determines if Winner exists
def isWinner
isHorizontal || isVertical || isL_diag || isR_diag 
end

#Horizontal Win
def isHorizontal
column=@board[@position[0]].join("") #combine array into string
column.include?("XXXX") || column.include?("OOOO") #check if string contains 4 in a row
end
 
 def isVertical
 index=@position[1] #get column position
 cString="" #string to get all X's or O's in column 
 for i in 0...@board.length
 cString.concat(@board[i][index])
 end
  cString.include?("XXXX") || cString.include?("OOOO") #check for vertical 4 in a row
 end

 #Check left diagonal win
def isL_diag
 current_p=[@position[0],@position[1]]
 down_r=[@position[0]+1,@position[1]+1]
 str=""
 until current_p[0]<0 || current_p[1]<0
 str += @board[current_p[0]][current_p[1]]
 current_p=[(current_p[0]-1),(current_p[1]-1)]
end
until down_r[0]>5 || down_r[1] > 6
str += @board[down_r[0]][down_r[1]]
down_r=[(down_r[0]+1),(down_r[1]+1)]
end
str.gsub!(/\s+/, '')
str.include?("XXXX") || str.include?("OOOO")
end
#Check right diagonal win
def isR_diag
 current_p=[@position[0],@position[1]]
 down_l=[@position[0]+1,@position[1]-1]
 str=""
 until current_p[0]<0 || current_p[1]>6
 str += @board[current_p[0]][current_p[1]]
 current_p=[(current_p[0]-1),(current_p[1]+1)]
end
until down_l[0]>5 || down_l[1] < 0
str += @board[down_l[0]][down_l[1]]
down_l=[(down_l[0]+1),(down_l[1]-1)]
end
 str.gsub!(/\s+/, '')
 
str.include?("XXXX") || str.include?("OOOO")
end
end

Connect4.new
