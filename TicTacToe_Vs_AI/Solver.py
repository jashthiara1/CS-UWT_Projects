# Jasharn Thiara
# TCSS 435 A
# Assignment 2

from Board import Board

def get_start_state(size):
    int_row = int(size[0])
    int_col = int(size[2])
    start_state = "";
    for i in range(int_row):
        for j in range(int_col):
            start_state += "-"
    print(len(start_state))
    return start_state

class Solver:

    # create solver object
    def __init__(self, player, search_method, size):
        self.player = player
        self.start_state = get_start_state(size)
        self.start_board = Board(player, size, self.start_state, search_method, None, 100)
        self.search_method = search_method
        self.size = size
        self.expanded = None
        self.depth = None

    # alpha beta pruning was not implemented
    def solve_ab(self):
        self.start_board.print_board(self.start_state)
        self.play()

    # plays game until there is a termination state (no moves are left to be made)
    def play(self):
        current_board = self.start_board
        current_board.print_board()
        self.depth = input("what depth would you like the min/max to run?: ")
        while not current_board.terminal_state():

            if (current_board.player == 1):
                # get move from user
                move = input("player 1: where would you like to move: ")
                current_board = current_board.update_board(move)
                current_board.print_board()

            if current_board.terminal_state():
                self.expanded = Board.expanded
                return "player one has won"


            # AI's turn
            print(current_board)
            temp_board = self.solve_mm(current_board)

            if (temp_board.player == 1):
                current_board = Board(2, self.size, temp_board.state, self.search_method, current_board, temp_board.value)
            else:
                current_board = Board(1, self.size, temp_board.state, self.search_method, current_board, temp_board.value)
            current_board.print_board()

            if current_board.terminal_state():
                self.expanded = Board.expanded
                return "player two has won"


    def solve_mm(self, board):
        # chosen depth for min/max
        current_board = board
        temp = board.create_tree(int(self.depth))

        # create tree method will assign max/min one level below the root
        if (len(temp) == 1):
            return temp[0]

        temp_boards = temp[1]
        index = 0

        # will choose either min or max level depending on which player AI is
        if current_board.player == 2:
            min = 100000
            index_of_min = -1
            counter = 0;
            for boardz in temp_boards:
                if (boardz.value < min):
                    min = boardz.value
                    index_of_min = counter
                counter +=1
            index = index_of_min
        else:
            max = -100000
            index_of_max = -1
            counter = 0;
            for boardz in temp_boards:
                if (boardz.value > max):
                    max = boardz.value
                    index_of_max = counter
                counter += 1
            index = index_of_max

        return temp[1][index]



    

