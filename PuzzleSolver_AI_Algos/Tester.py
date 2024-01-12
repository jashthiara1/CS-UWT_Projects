# Jasharn Thiara
# TCSS 435 A
# Programming Assignment 1

from Solver import Solver
from Board import Board


class Tester:

    # takes a solver object and will create output
    def build_output(self):
        temp = ""
        temp += "size: " + str(self.size) + "\n"
        temp += "initial: " + '"' + str(self.start_board.state) + '"\n'
        temp += "Goal: " + '"' + str(self.goal_state) + '"\n'
        temp += "searchmethod: " + str(self.search_method) + "\n"
        temp += str(self.depth) + ", " + str(self.numCreated) + ", " + str(self.numExpanded) + ", " + str(self.maxFringe) + "\n"
        temp += "------------------------------------\n"
        return temp

    response = "yes"
    s = ""

    # method will run until user enters anything besides yes or y
    # method will accept size, initial state, and search method
    # note will accept initial state declared as (ex: 1234) and not "1234"
    while response.lower() == "yes" or response.lower() == "y":
        # get inputs
        size_input = input("what is the size:")
        size_initial_state = input("what is the initial state: ")
        size_search_method = input("what is the search method: ")

        # create solver object with input
        solver = Solver(int(size_input), str(size_initial_state), (str(size_search_method)).lower())

        # activate will hold the solution path
        activate = solver.solve()

        # display path
        for states in activate:
            print(states.print_board())

        # pass to output method
        s += build_output(solver)

        response = input("would you like to continue?: ").lower()

    # examples of initializing solver objects
    # solver1 = Solver(2, "32 1", "DFS")
    solver7 = Solver(7, "6012345D789ABCKEFGHIJRLMNOPQYSTUVWXfZabcde ghijkl", "Astar")
    solver7.solve()
    build_output(solver7)

    # write output
    with open("Readme.txt", 'w') as file:
        file.write(s)
    file.close()

