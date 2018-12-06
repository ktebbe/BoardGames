ratings <- read.csv("gameratings.csv", as.is=T)
names(ratings) <- c("Name", "Random", "Social", "Learning", "Time", "Paths")


tab <- as.data.frame(matrix(nrow = 5, ncol = 2))
names(tab) <- c("Feature", "Scale")
tab[1, ] <- c("Random", "Random --- Deterministic")
tab[2, ] <- c("Social", "Social --- Insular")
tab[3, ] <- c("Learning", "Easy to learn --- Hard to learn")
tab[4, ] <- c("Time", "Quick to play --- wtf how is the game not over")
tab[5, ] <- c("Paths", "One path to victory -- many paths")

cols <- c("Social", "Learning")
vals <- c(-4, -4)
calculateDistance <- function(cols, vals){
  sub <- ratings[,c("Name", cols)]
  sub$distance <- 0
  for(i in 1:nrow(sub)){
    inner <- 0
    ## loop through each selected feature
    for(j in 1:length(vals)){
      inner <- inner + (vals[j] - sub[i, cols[j]])^2
    }
    ## store the distance for this game
    sub$distance[i] <- sqrt(inner)
  }
  
}