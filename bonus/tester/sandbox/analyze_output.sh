./a.out 5  1 1 3 3 2 2 4 4


[5] 0x6517846e33a0 -> [1] 0x6517846e3380 -> [1] 0x6517846e3360 -> [3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [2] 0x6517846e32e0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). list starts
, size 9
found new smalles_node
found new smalles_node

------------------
smallest_node(1) 0x6517846e3360 
[5] 0x6517846e33a0 -> [1] 0x6517846e3380 -> [1] 0x6517846e3360 -> [3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [2] 0x6517846e32e0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor before swap:, size 9
[1] 0x6517846e3360 -> [1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [2] 0x6517846e32e0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor after swap:, size 9

[1] 0x6517846e3360 -> [1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [2] 0x6517846e32e0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Head now:, size 9


**********************
[1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [2] 0x6517846e32e0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Cursor now:, size 8
found new smalles_node

------------------
smallest_node(1) 0x6517846e3380 
[1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [2] 0x6517846e32e0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor before swap:, size 8
[1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [2] 0x6517846e32e0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor after swap:, size 8












Original head:   [1] 0x6517846e3360 -> [1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [2] 0x6517846e32e0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Head now:, size 9

Cursor.:         [5] 0x6517846e33a0 -> [3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [2] 0x6517846e32e0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Cursor now:, size 7

smallest_node(2) 0x6517846e32e0 
[5] 0x6517846e33a0 -> [3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [2] 0x6517846e32e0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor before swap:, size 7
[2] 0x6517846e32e0 -> [3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor after swap:, size 7

Perfect swap smart dude
However the poor old head doesn't know that it's next was updated????

[1] 0x6517846e3360 -> [1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Head now:, size 5


**********************
[3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Cursor now:, size 6
found new smalles_node
found new smalles_node
found new smalles_node

------------------
smallest_node(2) 0x6517846e3300 
[3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [2] 0x6517846e3300 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor before swap:, size 6
[2] 0x6517846e3300 -> [3] 0x6517846e3320 -> [3] 0x6517846e3340 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor after swap:, size 6

[1] 0x6517846e3360 -> [1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Head now:, size 5


**********************
[3] 0x6517846e3320 -> [3] 0x6517846e3340 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Cursor now:, size 5
found new smalles_node
found new smalles_node

------------------
smallest_node(3) 0x6517846e3340 
[3] 0x6517846e3320 -> [3] 0x6517846e3340 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor before swap:, size 5

=======================

Swapping second to head 
[3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). 
INside controversial swap firs and second node
, size 5

End controversial swap

=======================
[3] 0x6517846e3340 -> [3] 0x6517846e3320 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor after swap:, size 5

[1] 0x6517846e3360 -> [1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Head now:, size 5


**********************
[3] 0x6517846e3320 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Cursor now:, size 4
found new smalles_node

------------------
smallest_node(3) 0x6517846e3320 
[3] 0x6517846e3320 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor before swap:, size 4
[3] 0x6517846e3320 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor after swap:, size 4

[1] 0x6517846e3360 -> [1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Head now:, size 5


**********************
[5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). Cursor now:, size 3
found new smalles_node
found new smalles_node
found new smalles_node

------------------
smallest_node(4) 0x6517846e32a0 
[5] 0x6517846e33a0 -> [4] 0x6517846e32c0 -> [4] 0x6517846e32a0 -> [NULL] (nil). cursor before swap:, size 3
[4] 0x6517846e32a0 -> [4] 0x6517846e32c0 -> [5] 0x6517846e33a0 -> [NULL] (nil). cursor after swap:, size 3

[1] 0x6517846e3360 -> [1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [NULL] (nil). Head now:, size 3


**********************
[4] 0x6517846e32c0 -> [5] 0x6517846e33a0 -> [NULL] (nil). Cursor now:, size 2
found new smalles_node

------------------
smallest_node(4) 0x6517846e32c0 
[4] 0x6517846e32c0 -> [5] 0x6517846e33a0 -> [NULL] (nil). cursor before swap:, size 2
[4] 0x6517846e32c0 -> [5] 0x6517846e33a0 -> [NULL] (nil). cursor after swap:, size 2

[1] 0x6517846e3360 -> [1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [NULL] (nil). Head now:, size 3


**********************
[5] 0x6517846e33a0 -> [NULL] (nil). Cursor now:, size 1
found new smalles_node

------------------
smallest_node(5) 0x6517846e33a0 
[5] 0x6517846e33a0 -> [NULL] (nil). cursor before swap:, size 1
[5] 0x6517846e33a0 -> [NULL] (nil). cursor after swap:, size 1
initial list_size = 9
###############[1] 0x6517846e3360 -> [1] 0x6517846e3380 -> [5] 0x6517846e33a0 -> [NULL] (nil). list finally
, size 3
List cmp:
FAILED 😱FAILED 😬
###############
-----------------------
