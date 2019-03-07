on(block2,block1).
on(block3,block2).
on(block4,block3).
on(block5,block1).
on(block6,block5).

above(Block, OnBlock) :- on(Block, OnBlock).

above(Block, AboveBlock) :- on(MiddleBlock,AboveBlock) , above(Block, MiddleBlock).
