## Blotto

### Author: Lauren Hanlon

## Introduction

The goal of this project was to explore strategies related to the game [Blotto](https://en.wikipedia.org/wiki/Blotto_games), and to try and come up with an optimal strategy that will be tested against other players. You can find the public GitHub repo including my code and report [here](https://github.com/laurenhanlon/blotto)!

To make the game more 21st centry-esque, here are the alternated instructions:

>You and another (equally qualified) candidate are running for office. There are 10 districts, numbered 1, 2, 3, ... 10 and worth 1, 2, 3, ... 10 votes respectively. You have 100 discrete units of resources (e.g. time, campaign workers), which you can allocate between the districts however you wish. Your opponent independently does the same. For each district, whoever applied the most resources to that district wins its votes (in the case of a tie, the indecisive voters abstain and no one receives any votes).

District  | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9 | D10
---       | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- 
Lauren    | 10 | 10 | 10 | 10 | 10 | 10 | 10 | 10 | 10 | 10
Opponent  | 20 | 0 | 10 | 5 | 10 | 5 | 10 | 20 | 0 | 20

>In this match, Lauren wins districts 2, 4, 6, 9, for a total of 21 votes, and her opponent wins districts 1, 8, 10, for a total of 19 votes (no one wins districts 3, 5, 7).

## Structure

- `blotto-functions.R` contains the functions used to create strategies, play games and test strategies.

- `blotto.Rmd` is the report containing the goal of the project, my methodology and my final strategy

## To Play a Game

If you would like to play a game of Blotto, simply create your strategy and your opponent's strategy as vectors in R as `myStrategy <- c(10, 10, 10, 10, 10, 10, 10, 10, 10, 10)` then after loading the required functions, simply write in R  `winner(myStrategy, opponentStrategy)`. A 1 indicates you won (yay!) while a 0 indicates your opponent won.

Happy playing!

