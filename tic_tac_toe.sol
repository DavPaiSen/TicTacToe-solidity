// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract tic_tac_toe {
    address playerOne;
    address playerTwo;
    uint8 [3][3] board;
    bool turn;
    function join() public{
        require(playerTwo == address(0), "all player slots are taken");
        if (playerOne == address(0)){
            playerOne = msg.sender;
            return;
        }
        if (playerTwo == address(0)){
            playerTwo = msg.sender;
            return;
        }
    }
    function play(uint8 row, uint8 column)public{
        require(playerTwo != address(0), "not all player are ready!");
        require(msg.sender == playerOne || turn, "wait your turn");
        require(msg.sender == playerTwo || !turn, "wait your turn");
        require(row >= 0 && row <= 2, "invalid row");
        require(column >= 0 && column <= 2, "invalid column");
        require(board[row][column] == 0, "already taken");
        if (turn){
            board[row][column] = 2;
            turn = false;
            return;
        }
        board[row][column] = 1;
        turn = true;
    }
}
