# Blotto Functions

randomStrategy <- function(votes, districts){
  'votes is number of allotted votes'
  'districts is number of districts'
  strategy <- c()
  i <- 0
  while (i < (districts)){
    rand <- sample(0:votes, 1)
    strategy <- append(strategy, rand)
    votes <- votes - rand
    i <- i + 1}
  strategy <- sample(strategy)
  return(strategy)
}

randomStrategy_Smart <- function(votes, districts){
  'votes is number of allotted votes'
  'districts is number of districts'
  'smart strategies where it orders the list to the right'
  strategy <- c()
  i <- 0
  while (i < (districts)){
    rand <- sample(0:votes, 1)
    strategy <- append(strategy, rand)
    votes <- votes - rand
    i <- i + 1}
  strategy <- sort(strategy)
  return(strategy)
}

randomStrategy_Smart2 <- function(votes, districts){
  'votes is number of allotted votes'
  'districts is number of districts'
  'smart strategies 2 where it orders the list to the right and keeps sample under 50'
  strategy <- c()
  i <- 0
  while (i < (districts)){
    rand <- sample(0:(votes/2), 1)
    strategy <- append(strategy, rand)
    votes <- votes - rand
    i <- i + 1}
  strategy <- sort(strategy)
  return(strategy)
}

makeRandomStrategies <- function(n, votes=100, districts=10, strategy){
  'n is number of random strategies we want'
  computerStrategies <- c()
  i <- 0
  while (i < n){
    x <- strategy(votes, districts)
    if (length(computerStrategies)==0){
      computerStrategies <- list(x)
    } else
      (computerStrategies <- append(computerStrategies, list(x)))
    i <- i + 1
  }
  return (computerStrategies)
}

winner <- function(myStrategy, oppStrategy){
  'plays a Blotto game'
  myScore <- 0
  oppScore <- 0
  i <- 1
  while (i <= length(myStrategy)) {
    if (myStrategy[i]>oppStrategy[i]){
      myScore <- myScore + i
    } else if (myStrategy[i]<oppStrategy[i]){
      oppScore <- oppScore + i
    }
    i <- i + 1
  }
  if(myScore > oppScore){
    winner = 1} else if (myScore==oppScore){winner=0} else winner=0
  return(winner)
}

calculateEfficiency <- function(myStrategy, n=1000, votes=100, districts=10, strategy){
  'n is the number of strategies we want to test'
  tests <- makeRandomStrategies(n, votes, districts, strategy)
  i <- 1
  won <- 0
  while (i < length(tests)){
    x <- winner(myStrategy, tests[[i]])
    won <- won + x
    i <- i + 1
  }
  percentWon = won / length(tests)
  return(percentWon)
}

weightedEfficiency <- function(myStrategy){
  return(calculateEfficiency(myStrategy, strategy=randomStrategy)*.20 +
           calculateEfficiency(myStrategy, strategy=randomStrategy_Smart)*.30 +
           calculateEfficiency(myStrategy, strategy=randomStrategy_Smart2)*.50)}

testStrategies2 <- function(strategies){
  efficiencies = c()
  for (i in strategies){
    x <- weightedEfficiency(i)
    efficiencies <- append(efficiencies, list(x)) 
  }
  return(efficiencies)
}
