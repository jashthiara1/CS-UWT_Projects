# Jasharn Thiara
# TCSS 435 A
# Programming Assignment 1

from Board import Board


class Solver:

    # create solver object
    def __init__(self, size, start_board, search_method):
        self.size = size
        self.start_board = Board(size, start_board, None, search_method, 0)
        self.search_method = search_method
        self.numCreated = 0
        self.depth = 0
        self.numExpanded = 0
        self.maxFringe = 0
        self.goal_state = get_goal(self)

    # solve method will call method depending on search method
    def solve(self):
        if self.search_method == "bfs" or self.search_method == "dfs":
            return self.BFS_DFS()
        elif self.search_method == "gbfs" or self.search_method == "astar":
            return self.GBFS_Astar()

    # solve method for both BFS and DFS
    def BFS_DFS(self):
        fringe = [self.start_board]
        visited = set()
        board = self.start_board

        while fringe:
            if self.maxFringe < len(fringe):
                self.maxFringe = len(fringe)

            # if we are using BFS we pop from the front, if DFS we pop from the back
            if self.search_method == "bfs":
                board = fringe.pop(0)
            elif self.search_method == "dfs":
                board = fringe.pop()

            visited.add(board.state)
            self.numExpanded += 1

            # check for goal state, if found a list of the path will be returned
            if board.state == self.goal_state:
                self.depth = board.depth
                return board.get_path()

            # iterate through the other potential states
            for other_board in board.get_states():
                if other_board.state not in visited:
                    self.numCreated += 1
                    fringe.append(other_board)
        # case no solution is found
        self.depth = -1

    # method that solves using GBFS or A* search
    def GBFS_Astar(self):
        fringe = [self.start_board]
        visited = set()

        # iterates until fringe is empty or solution a is found
        while fringe:
            prioritized = []
            if self.maxFringe < len(fringe):
                self.maxFringe = len(fringe)

            # Sorts order of states based on manhattan distance
            # if the search method is Astar, will be sorted on value of heuristics+depth
            if self.search_method == "astar":
                fringe.sort(key=lambda x: x.Astar_value)
            else:
                fringe.sort(key=lambda x: x.greedy_value)

            board = fringe.pop(0)
            self.numExpanded += 1
            visited.add(board.state)

            # check for goal state, if found a list of the path will be returned
            if board.state == self.goal_state:
                print(len(prioritized))
                self.depth = board.depth
                return board.get_path()

            # retrieve other states
            for other_board in board.get_states():
                # set value for manhattan distance
                other_board.set_greedy_value(self.goal_state)
                # if A* add additional value of depth
                if self.search_method == "astar":
                    other_board.set_Astar()

                prioritized.append(other_board)

            # adds boards in fringe if they are not already visited
            for boards in prioritized:
                if boards.state not in visited:
                    self.numCreated += 1
                    fringe.append(boards)
        # case no solution is found
        self.depth = -1


# method sets teh goal state depending on size
def get_goal(self):
    if self.size == 2:
        return "213 "
    elif self.size == 3:
        return " 12345678"
    elif self.size == 4:
        return "123456789ABCDEF "
    elif self.size == 5:
        return " 123456789ABCDEFGHIJKLMNO"
    elif self.size == 6:
        return " 0123456789ABCDEFGHIJKLMNOPQRSTUVWXY"
    elif self.size == 7:
        return " 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkl"
    else:
        return " "
