HW_SOURCE_FILE = __file__


def num_eights(pos):
    """Returns the number of times 8 appears as a digit of pos.

    >>> num_eights(3)
    0
    >>> num_eights(8)
    1
    >>> num_eights(88888888)
    8
    >>> num_eights(2638)
    1
    >>> num_eights(86380)
    2
    >>> num_eights(12345)
    0
    >>> num_eights(8782089)
    3
    >>> from construct_check import check
    >>> # ban all assignment statements
    >>> check(HW_SOURCE_FILE, 'num_eights',
    ...       ['Assign', 'AnnAssign', 'AugAssign', 'NamedExpr', 'For', 'While'])
    True
    """
    if pos == 0:
        return 0
    if pos % 10 == 8:
        return 1 + num_eights(pos // 10)
    else:
        return num_eights(pos // 10)



def pingpong(n):
    """Return the nth element of the ping-pong sequence.

    >>> pingpong(8)
    8
    >>> pingpong(10)
    6
    >>> pingpong(15)
    1
    >>> pingpong(21)
    -1
    >>> pingpong(22)
    -2
    >>> pingpong(30)
    -2
    >>> pingpong(68)
    0
    >>> pingpong(69)
    -1
    >>> pingpong(80)
    0
    >>> pingpong(81)
    1
    >>> pingpong(82)
    0
    >>> pingpong(100)
    -6
    >>> from construct_check import check
    >>> # ban assignment statements
    >>> check(HW_SOURCE_FILE, 'pingpong',
    ...       ['Assign', 'AnnAssign', 'AugAssign', 'NamedExpr'])
    True
    """
    if n == 1:
        return 1
    else:
        if not direction(n-1):
            return pingpong(n-1) - 1
        else: 
            return pingpong(n-1) + 1

def direction(m):
    cnt = 0
    for i in range(1, m+1):
        if i % 8 == 0 or num_eights(i) != 0:
            cnt += 1
    if cnt % 2 == 0:
        return True
    else:
        return False


def next_larger_coin(coin):
    """Returns the next larger coin in order.
    >>> next_larger_coin(1)
    5
    >>> next_larger_coin(5)
    10
    >>> next_larger_coin(10)
    25
    >>> next_larger_coin(2) # Other values return None
    """
    if coin == 1:
        return 5
    elif coin == 5:
        return 10
    elif coin == 10:
        return 25


def next_smaller_coin(coin):
    """Returns the next smaller coin in order.
    >>> next_smaller_coin(25)
    10
    >>> next_smaller_coin(10)
    5
    >>> next_smaller_coin(5)
    1
    >>> next_smaller_coin(2) # Other values return None
    """
    if coin == 25:
        return 10
    elif coin == 10:
        return 5
    elif coin == 5:
        return 1


def count_coins(change):
    """Return the number of ways to make change using coins of value of 1, 5, 10, 25.
    >>> count_coins(15)
    6
    >>> count_coins(10)
    4
    >>> count_coins(20)
    9
    >>> count_coins(100) # How many ways to make change for a dollar?
    242
    >>> count_coins(200)
    1463
    >>> from construct_check import check
    >>> # ban iteration
    >>> check(HW_SOURCE_FILE, 'count_coins', ['While', 'For'])
    True
    """
    return my_countcoins(change, 25)

def my_countcoins(n, m):
    if m == None:
        return 0
    if n == 1 or n == 0:
        return 1
    if n < m:
        return my_countcoins(n, next_smaller_coin(m))
    return my_countcoins(n-m, m) + my_countcoins(n, next_smaller_coin(m))


anonymous = False  # Change to True if you would like to remain anonymous on the final leaderboard.


def beaver(f):
    "*** YOUR CODE HERE ***"
    # I don't know how to do this. How can I find the maxmium exec times of a interpreter?
    # How can I do this without a recursive func?

    
def beaver_syntax_check():
    """
    Checks that definition of beaver is only one line.

    >>> # You aren't expected to understand the code of this test.
    >>> import inspect, ast
    >>> source = inspect.getsource(beaver)
    >>> num_comments = source.count('\\n    #')
    >>> contains_default_line = '"*** YOUR CODE HERE ***"' in source
    >>> num_lines = source.count('\\n') - num_comments
    >>> (num_lines == 2) or (num_lines == 3 and contains_default_line)
    True
    """
    # You don't need to edit this function. It's just here to check your work.


def beaver_run_test():
    """
    Checks to make sure f gets called at least 1000 times.

    >>> counter = 0
    >>> def test():
    ...     global counter
    ...     counter += 1
    >>> beaver(test)
    >>> counter >= 1000
    True
    """
    # You don't need to edit this function. It's just here to check your work.
