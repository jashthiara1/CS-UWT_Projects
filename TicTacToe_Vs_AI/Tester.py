# Jasharn Thiara
# TCSS 435 A
# Assignment 2

from Solver import Solver
from Board import Board

class Tester:

    def build_output(play, solver):
        temp = ""
        temp += "*** "
        temp += solver.size
        temp += " Boards ***\n\n"
        temp += "AI is player "
        if solver.player == 1:
            temp += "2:\n"
        else:
            temp += "1:\n"
        
        temp += "Minimax\n"
        temp += "nodes expanded: "
        temp += str(Board.expanded)
        temp += "\n"
        temp += "Depth level "
        temp += solver.depth
        temp += "\n"


        return temp

    response = "yes"
    s = "Evaluation Function:\n"
    s += "The function I used to evaluate board states was choosing the move that blocks the most places.\n"
    s += "this would result the opposing player with the least amount of moves possible.\n\n"

    # method will run until user enters anything besides yes or y
    # method will accept size, initial state, and search method
    # note will accept initial state declared as (ex: 1234) and not "1234"
    while response.lower() == "yes" or response.lower() == "y":

        player = input("Enter player: ")
        search_method = input("Enter search method: ")
        size_input = input("Enter size: ")

        # create solver object with input
        solver = Solver(int(player), (str(search_method)).lower(), size_input)
        winner = solver.play()
        print(winner)

        # pass to output method
        s += build_output(winner, solver)

        response = input("would you like to continue?: ").lower()

    
    # write output
    with open("Readme.txt", 'w') as file:
        file.write(s)
    file.close()


