# Jasharn Thiara
# TCSS 435 A
# Programming Assignment 1

import math


# method to find index of blank state
def find_blank(state):
    index = state.find(" ")
    return index


# method to swap characters
def swap_chars(state, index1, index2):
    chars = list(state)
    chars[index1], chars[index2] = chars[index2], chars[index1]
    temp = ''.join(chars)
    return temp


class Board:

    def __init__(self, size, state, parent, search_method, depth):
        self.size = size
        self.state = state
        self.parent = parent
        self.blank = find_blank(state)
        self.search_method = search_method
        self.greedy_value = None
        self.depth = depth
        self.Astar_value = None

    # method will find the number of possible states from a board
    def get_states(self):
        states = []

        # can move to the left
        if self.blank % self.size > 0:
            new_state = swap_chars(self.state, self.blank, self.blank - 1)
            states.append(Board(self.size,new_state, self, self.search_method, self.depth+1))
        # can move right
        if self.blank % self.size < (self.size - 1):
            new_state1 = swap_chars(self.state, self.blank, self.blank + 1)
            states.append(Board(self.size, new_state1, self, self.search_method, self.depth+1))
        # can move up
        if self.blank >= self.size:
            new_state2 = swap_chars(self.state, self.blank, self.blank-self.size)
            states.append(Board(self.size, new_state2, self, self.search_method, self.depth+1))
        # can move down
        if self.blank < ((self.size * self.size) - self.size):
            new_state3 = swap_chars(self.state, self.blank, self.blank + self.size)
            states.append(Board(self.size, new_state3, self, self.search_method, self.depth+1))
        return states

    # method prints out board
    def print_board(self):
        s = "_______\n|"
        x = 0
        for char in self.state:
            s += char
            if x % self.size == self.size-1:
                s += "|\n|"
            x += 1

        s += "______|"
        return s

    # method will trace back the path to the initial board.
    def get_path(self):
        path = []
        temp_board = self

        # iterate to root node
        while temp_board is not None:
            path.append(temp_board)
            temp_board = temp_board.parent

        path.reverse()
        return path

    # helper method to greedy search
    # will give greedy value depending on how far the blank spaces are in current board and goal board
    # utilizes manhattan distance
    def set_greedy_value(self, goal_state):

        # find blank in goal state
        goal_blank = goal_state.find(" ")
        row_difference = abs(math.floor(self.blank/self.size)-math.floor(goal_blank/self.size))
        col_difference = abs((self.blank % self.size)-(goal_blank % self.size))
        self.greedy_value = abs(row_difference+col_difference)

    # helper method to A*
    # will combine depth and manhattan distance heuristic
    def set_Astar(self):
        self.Astar_value = self.greedy_value+self.depth
