# Jasharn Thiara
# TCSS 435 A
# Assignment 2

def swap_chars(state, index, char):
    chars = list(state)
    chars[index] = char
    temp = ''.join(chars)
    return temp

def get_symbol(player):
    if player == 1:
        return "X"
    else:
        return "O"

class Board:
    expanded = 0;

    def __init__(self, player, size, state,  search_method, parent, value):
        self.player = player
        self.size = size
        self.state = state
        self.search_method = search_method
        self.row = int(size[0])
        self.col = int(size[2])
        self.parent = parent
        self.symbol = get_symbol(player)
        self.value = value


    # method will find the number of possible states from a board
    def get_states(self):
        states = []
        index = 0;
        for char in self.state:
            # possible place to move
            if (char == "-"):

                # if/else is to switch players for children
                if self.player == 1:
                    temp = Board(2, self.size, self.state, self.search_method, self, None)
                else:
                    temp = Board(1, self.size, self.state, self.search_method, self, None)

                col_from_index = (index % self.col) + 1
                row_from_index = (index // self.col) + 1
                move = str(row_from_index) + "/" + str(col_from_index)

                # update board to proper state and add to list
                temp = temp.update_board(move)
                states.append(temp)
            index += 1
        return states

    # idea here is we want a state where more moves are blocked or has less "-" symbols
    def evaluation_funct(self):
        # start with 100 (since every move is free)
        counter = 100;
        for char in self.state:
            if (char == "-"):
                counter -= 1;
        # max player
        if (self.player == 1):
            return counter
        # min player
        else:
            return (counter * -1)

    # method will take a move and update the board
    def update_board(self, move):

        # translate move (cordinate) to index to work with string state
        index = ((int(move[0])-1) * self.col + (int(move[2])-1))
        temp_state = self.state

        # swap with symbol of player
        temp_state = swap_chars(temp_state, index, self.symbol)

        # update locations that cannot be moved into now
        if (int(move[0]) > 1):
            temp_state = swap_chars(temp_state, index - self.col, "/")
        if (int(move[0]) < self.row):
            temp_state = swap_chars(temp_state, index + self.col, "/")
        if (int(move[2]) > 1):
            temp_state = swap_chars(temp_state, index - 1, "/")
        if (int(move[2]) < self.col):
            temp_state = swap_chars(temp_state, index + 1 , "/")
        if (int(move[0]) > 1 and int(move[2]) < self.col):
            temp_state = swap_chars(temp_state, (index - self.col) + 1, "/")
        if (int(move[0]) > 1 and int(move[2]) > 1):
            temp_state = swap_chars(temp_state, (index - self.col) - 1, "/")
        if (int(move[0]) < self.row and int(move[2]) < self.col):
            temp_state = swap_chars(temp_state, (index + self.col) + 1, "/")
        if (int(move[0]) < self.row  and int(move[2]) > 1):
            temp_state = swap_chars(temp_state, (index + self.col) - 1, "/")

        # create new board and get its value
        temp_Board = Board(self.player, self.size, temp_state, self.search_method, self, None)
        temp_Board.value = temp_Board.evaluation_funct()
        return temp_Board

    # method checks if move to be made is valid
    def is_move_valid(self, move):
        index = ((int(move[0]) - 1) * 7 + (int(move[2]) - 1))
        
        if self.state[index] == "/" or self.state[index] == "X" or self.state[index] == "O":
            return False;
        else:   
            return True;

    # for a terminal state, there needs to be a board filled without a "-" symbol
    def terminal_state(self):
        if "-" in self.state:
            return False
        else:
            return True

    # method will create a tree and recursviely assign values from top to bottom
    # using the min_max helper method
    def create_tree(self, depth):
        # will evaluate values at the bottom level of tree
        if (depth == 0):
            Board.expanded += 1
            return [self]

        children = self.get_states()
        for state in children:
            # in the case we have found a terminal state, we cannot branch its children
            # since the game will be over. 
            if state.terminal_state():
                state.value = state.evaluation_funct()
                return [state]

            # recursively call next depth
            state.create_tree(depth-1)

            # this method will be called after bottom levels are assigned
            state.value = state.min_max()
        return [self, children]

    # Helper method 
    def min_max(self):
            children = self.get_states()
            
            # will iterate through states and track max/min depending on which player AI is
            if self.player == 1:
                max = -1000000
                for state in children:
                    if state.value > max:
                        max = state.value
                return max
            else:
                min = 100000000000000
                for state in children:
                    if (state.value < min):
                        min = state.value
                return min


    def print_board(self):
        index = 0;
        s = "    ";
        for z in range(self.col):
            s += str(z + 1)
            s+= " "
        s += "\n"

        for i in range(self.row):
            s += str(i + 1)
            s += (" [ ")
            for j in range(self.col):
                s += self.state[index]
                s += " "
                index += 1
            s += "]\n"
        print(s)





        


        
