#!/usr/bin/env Rscript
### Read two games worth of Powder League Stats. 
## Arg 1 = date (25, 1, etc); Arg 2 = week (1, 2, etc); Arg 3 = month (6, 7, etc.)

## Set up for gathering game data
setwd("~/Desktop/curr_Chris/Sportsdada/sportsdada/Powder")
rm(list = ls())
library(readxl)
library(xlsx)
library(dplyr)
library(stringr)

day <- 9
week <- 9
month <- 8

game_num <- readRDS("gameNum.rds")

master_box <- read.csv("Master.csv")

ids <- data.frame(team = c("Bullock", "Berger", "Stan", "Erickson", "Humpherys", 
                    "Drisdom", "Joyce", "Covington", "Egan", "Barkley (All Star)", "Seljaas (All Star)"), 
                  team_id = c("BUL", "BGR", "STN", "ERK", "HMP", "DDM", "JYC", "CVN", "EGN", "ASGB", "ASGS"))


#args <- commandArgs(trailingOnly=TRUE)
args <- c(day, week, month)

dates <- read.csv("game_dates.csv")
dates <- data.frame(rbind(paste0(args[3], "/", args[1], "/", 22), dates))
colnames(dates) <- c("dates")
write.csv(dates, "game_dates.csv", row.names = FALSE)

### Gather data for Game 1
df <- list.files(pattern = paste0("G1 ", args[3], "-", args[1], "(.*)xlsm$"), path = paste0("Week", args[2], "/"))

final_box <- data.frame(NA)
for (i in 1:length(df)) {
  temp1 <- read_excel(paste0("Week", args[2], "/", df[i]))
  
  if (substr(df[i], 1, 2) == "FG") {
    if (as.numeric(temp1[2,1]) > as.numeric(temp1[2,3])) {
      winner <- str_remove(as.character(temp1[1,1]), "Team ")
    } else {
      winner <- str_remove(as.character(temp1[1,3]), "Team ")
    }
  }
  
  start_col <- which(colnames(temp1) == "Home Team (Gray)")
  if (start_col != 1) {
    temp1 <- temp1[-c(1:(start_col - 1))]
  }
  temp1 <- data.frame(cbind("", temp1))
  temp1[is.na(temp1)] <- ""
  box_start <- which(temp1[1,] == "#") + 1
  colnames(temp1)[box_start-1] <- "#"
  split_row <- which(temp1$Home.Team..Gray. == "")[2]
  temp1_p1 <- temp1[c(2:(split_row-2)),]
  temp1_p2 <- temp1[-c(1:(split_row+2), length(temp1$`#`)),]
  temp1_p1$`#` <- as.numeric(temp1_p1$`#`)
  temp1_p2$`#` <- as.numeric(temp1_p2$`#`)
  temp1_p1$`#`[is.na(temp1_p1$`#`)] <- 0
  temp1_p2$`#`[is.na(temp1_p2$`#`)] <- 0
  temp1_p1 <- temp1_p1 %>% 
    arrange(temp1_p1$`#`, temp1_p1[3], temp1_p1$Home.Team..Gray.)
  temp1_p2 <- temp1_p2 %>% 
    arrange(temp1_p2$`#`, temp1_p2[3], temp1_p2$Home.Team..Gray.)
  if ("MP" %in% temp1[1,]) {
    mp_spot <- which(temp1[1,] == "MP")
    colnames(temp1_p1)[mp_spot] <- "MP"
    colnames(temp1_p2)[mp_spot] <- "MP"
    temp1_p1$MP <- round(as.numeric(temp1_p1$MP), 1)
    temp1_p2$MP <- round(as.numeric(temp1_p2$MP), 1)
  }
  
  temp1[c(2:(split_row-2)),] <- temp1_p1
  temp1[c((split_row+3):(length(temp1$`#`) - 1)),] <- temp1_p2
  
  if (i == 1) {
    final_box <- data.frame(cbind(final_box, temp1))
    final_box <- final_box[,-c(1)]
  } else {
    final_box <- data.frame(cbind(final_box, temp1[,box_start:length(temp1)]))
  } 
  
  print(i)
}
if (length(which(final_box[1,] == "")) > 1) {
  final_box <- final_box[-which(final_box[1,] == "")[2:length(which(final_box[1,] == ""))]]
}
len <- length(colnames(final_box))
vec <- c()
for (i in 5:len) {
  vec <- append(vec, final_box[1, i])
  # final_box[1,i] <- ""
}
# final_box[1,4] <- ""
colnames(final_box) <- append(c(".", "Home.Team..Gray.", colnames(final_box)[3], "#"), vec)
pts <- c("PTS", "FG", "3PT", "FT")
start <- c(".", "Home.Team..Gray.", colnames(final_box)[3], "#", "MP")
reb <- c("OREB", "DREB", "TREB")
other <- c("AST", "STL", "BLK", "TOV", "PF", "TimeOuts")
col_order <- append(append(start[which(start %in% colnames(final_box))], pts[which(pts %in% colnames(final_box))]), 
                      append(reb[which(reb %in% colnames(final_box))], other[which(other %in% colnames(final_box))]))
final_box <- final_box[, col_order]
vec <- c()
len <- length(final_box)
for (i in 4:len) {
  vec <- append(vec, "")
  # final_box[1,i] <- ""
}

if ("MP" %in% final_box[1,]) {
  delete_row <- which(final_box$MP == "0")
} else {
  delete_row <- c()
  for (i in 1:length(final_box$Home.Team..Gray.)) {
    played <- c()
    if (i != split_row && i != (split_row + 1)) {
      for (j in 5:length(final_box)) {
        if (final_box[i,j] == "0" || final_box[i,j] == "0-0" || final_box[i,j] == "") {
          played <- append(played, FALSE)
        } else {
          played <- append(played, TRUE)
          break
        }
      }
      if (length(which(played == TRUE)) == 0) {
        delete_row <- append(delete_row, i)
      }
    }
    # print(i)
  }
}

if (length(delete_row) > 0) {
  final_box <- final_box[-delete_row,]
}
colnames(final_box) <- append(c("", "Home Team (Gray)", colnames(final_box)[3]), vec)

###########################################
######## Add Box Score to Powder.xlsx #######
#########################################
# write.xlsx(final_box, file = "Powder.xlsx", sheetName = paste0("0", args[3], "-", day, " G1"), append = TRUE)

len <- length(final_box$`Home Team (Gray)`)
split_row <- which(final_box$`Home Team (Gray)` == "")[2]
final_box[c(1:(split_row - 1)), 1] <- str_remove(colnames(final_box)[3], "Team.")
final_box[c((split_row + 2):len), 1] <- str_remove(final_box[split_row + 1, 3], "Team ")
colnames(final_box) <- final_box[1,]
colnames(final_box)[1] <- "team"
final_box <- final_box[-c(1, split_row, split_row + 1, split_row + 2),]
if ("TimeOuts" %in% colnames(final_box)) {
  final_box <- final_box[-c(which(colnames(final_box) == "TimeOuts"))]
}
final_box$home <- ids$team_id[which(ids$team == final_box$team[1])]
final_box$away <- ids$team_id[which(ids$team == final_box$team[length(final_box$team)])]
for (i in 1:length(final_box$team)) {
  final_box$team_id[i] <- ids$team_id[which(ids$team == final_box$team[i])]
}
final_box$game_id <- game_num
final_box$time <- "7:00 PM"
final_box$date <- paste0(args[3], "/", args[1], "/22")
final_box$player_id <- ifelse(final_box$`#`=="Total:", "", tolower(paste0(final_box$First, final_box$Last, "_01")))
final_box$winner <- ids$team_id[which(ids$team == winner)]
for (i in 1:length(final_box$date)) {
  if (final_box$`#`[i]=="Total:") {
    final_box$g[i] <- ""
  } else {
    if (length(which(master_box$player_id == final_box$player_id[i])) > 0) {
      final_box$g[i] <- as.numeric(max(master_box[which(master_box$player_id == final_box$player_id[i]),]$g)) + 1
    } else {
      final_box$g[i] <- 1
    }
  }
}
if ("FG" %in% colnames(final_box)) {
  final_box$fga <- sub(".*-(.*)", "\\1", final_box$FG)
  final_box$fgm <- sub("(^[^-]+)-.*", "\\1", final_box$FG)
  final_box$`fg%` <- as.numeric(final_box$fgm) / as.numeric(final_box$fga)
}
if ("3PT" %in% colnames(final_box)) {
  final_box$`3pa` <- sub(".*-(.*)", "\\1", final_box$`3PT`)
  final_box$`3pm` <- sub("(^[^-]+)-.*", "\\1", final_box$`3PT`)
  final_box$`3p%` <- as.numeric(final_box$`3pm`) / as.numeric(final_box$`3pa`)
}
if ("FT" %in% colnames(final_box)) {
  final_box$fta <- sub(".*-(.*)", "\\1", final_box$FT)
  final_box$ftm <- sub("(^[^-]+)-.*", "\\1", final_box$FT)
  final_box$`ft%` <- as.numeric(final_box$ftm) / as.numeric(final_box$fta)
}
colnames(final_box) <- tolower(colnames(final_box))

if (!("winner" %in% colnames(final_box))) {
  final_box$winner <- NA
}
if (!("g" %in% colnames(final_box))) {
  final_box$g <- NA
}
if (!("gs" %in% colnames(final_box))) {
  final_box$gs <- NA
}
if (!("mp" %in% colnames(final_box))) {
  final_box$mp <- NA
}
if (!("pts" %in% colnames(final_box))) {
  final_box$pts <- NA
}
if (!("fga" %in% colnames(final_box))) {
  final_box$fga <- NA
}
if (!("fgm" %in% colnames(final_box))) {
  final_box$fgm <- NA
}
if (!("fg%" %in% colnames(final_box))) {
  final_box$`fg%` <- NA
}
if (!("3pa" %in% colnames(final_box))) {
  final_box$`3pa` <- NA
}
if (!("3pm" %in% colnames(final_box))) {
  final_box$`3pm` <- NA
}
if (!("3p%" %in% colnames(final_box))) {
  final_box$`3p%` <- NA
}
if (!("fta" %in% colnames(final_box))) {
  final_box$fta <- NA
}
if (!("ftm" %in% colnames(final_box))) {
  final_box$ftm <- NA
}
if (!("ft%" %in% colnames(final_box))) {
  final_box$`ft%` <- NA
}
if (!("oreb" %in% colnames(final_box))) {
  final_box$oreb <- NA
}
if (!("dreb" %in% colnames(final_box))) {
  final_box$dreb <- NA
}
if (!("treb" %in% colnames(final_box))) {
  final_box$treb <- NA
}
if (!("ast" %in% colnames(final_box))) {
  final_box$ast <- NA
}
if (!("stl" %in% colnames(final_box))) {
  final_box$stl <- NA
}
if (!("blk" %in% colnames(final_box))) {
  final_box$blk <- NA
}
if (!("tov" %in% colnames(final_box))) {
  final_box$tov <- NA
}
if (!("pf" %in% colnames(final_box))) {
  final_box$pf <- NA
}
colnames(master_box)[c(12, 19:22, 25)] <- c("#", "fg%", "3pa", "3pm", "3p%", "ft%")
master_col_order <- colnames(master_box)
final_box <- final_box[, master_col_order]
if (length(which(master_box$date == "")) > 0) {
  master_box <- master_box[-c(which(master_box$date == "")),]
}

master_box <- data.frame(rbind(master_box, final_box))
master_box[is.na(master_box)] <- ""

### Add data to Master.csv
write.csv(master_box, file = "Master.csv", row.names = FALSE)

## Increase game id
game_num <- game_num + 1
saveRDS(game_num, "gameNum.rds")
game_num <- readRDS("gameNum.rds")

############################################
#### GAME 2 ##############################
########################################
df <- list.files(pattern = paste0("G2 ", args[3], "-", args[1], "(.*)xlsm$"), path = paste0("Week", args[2], "/"))
master_box <- read.csv("Master.csv")

final_box <- data.frame(NA)
for (i in 1:length(df)) {
  temp1 <- read_excel(paste0("Week", args[2], "/", df[i]))
  
  if (substr(df[i], 1, 2) == "FG") {
    if (as.numeric(temp1[2,1]) > as.numeric(temp1[2,3])) {
      winner <- str_remove(as.character(temp1[1,1]), "Team ")
    } else {
      winner <- str_remove(as.character(temp1[1,3]), "Team ")
    }
  }
  
  start_col <- which(colnames(temp1) == "Home Team (Gray)")
  if (start_col != 1) {
    temp1 <- temp1[-c(1:(start_col - 1))]
  }
  temp1 <- data.frame(cbind("", temp1))
  temp1[is.na(temp1)] <- ""
  box_start <- which(temp1[1,] == "#") + 1
  colnames(temp1)[box_start-1] <- "#"
  split_row <- which(temp1$Home.Team..Gray. == "")[2]
  temp1_p1 <- temp1[c(2:(split_row-2)),]
  temp1_p2 <- temp1[-c(1:(split_row+2), length(temp1$`#`)),]
  temp1_p1$`#` <- as.numeric(temp1_p1$`#`)
  temp1_p2$`#` <- as.numeric(temp1_p2$`#`)
  temp1_p1$`#`[is.na(temp1_p1$`#`)] <- 0
  temp1_p2$`#`[is.na(temp1_p2$`#`)] <- 0
  temp1_p1 <- temp1_p1 %>% 
    arrange(temp1_p1$`#`, temp1_p1[3], temp1_p1$Home.Team..Gray.)
  temp1_p2 <- temp1_p2 %>% 
    arrange(temp1_p2$`#`, temp1_p2[3], temp1_p2$Home.Team..Gray.)
  if ("MP" %in% temp1[1,]) {
    mp_spot <- which(temp1[1,] == "MP")
    colnames(temp1_p1)[mp_spot] <- "MP"
    colnames(temp1_p2)[mp_spot] <- "MP"
    temp1_p1$MP <- round(as.numeric(temp1_p1$MP), 1)
    temp1_p2$MP <- round(as.numeric(temp1_p2$MP), 1)
  }
  
  temp1[c(2:(split_row-2)),] <- temp1_p1
  temp1[c((split_row+3):(length(temp1$`#`) - 1)),] <- temp1_p2
  
  if (i == 1) {
    final_box <- data.frame(cbind(final_box, temp1))
    final_box <- final_box[,-c(1)]
  } else {
    final_box <- data.frame(cbind(final_box, temp1[,box_start:length(temp1)]))
  } 
  
  print(i)
}
if (length(which(final_box[1,] == "")) > 1) {
  final_box <- final_box[-which(final_box[1,] == "")[2:length(which(final_box[1,] == ""))]]
}
len <- length(colnames(final_box))
vec <- c()
for (i in 5:len) {
  vec <- append(vec, final_box[1, i])
  # final_box[1,i] <- ""
}
# final_box[1,4] <- ""
colnames(final_box) <- append(c(".", "Home.Team..Gray.", colnames(final_box)[3], "#"), vec)
pts <- c("PTS", "FG", "3PT", "FT")
start <- c(".", "Home.Team..Gray.", colnames(final_box)[3], "#", "MP")
reb <- c("OREB", "DREB", "TREB")
other <- c("AST", "STL", "BLK", "TOV", "PF", "TimeOuts")
col_order <- append(append(start[which(start %in% colnames(final_box))], pts[which(pts %in% colnames(final_box))]), 
                    append(reb[which(reb %in% colnames(final_box))], other[which(other %in% colnames(final_box))]))
final_box <- final_box[, col_order]
vec <- c()
len <- length(final_box)
for (i in 4:len) {
  vec <- append(vec, "")
  # final_box[1,i] <- ""
}

if ("MP" %in% final_box[1,]) {
  delete_row <- which(final_box$MP == "0")
} else {
  delete_row <- c()
  for (i in 1:length(final_box$Home.Team..Gray.)) {
    played <- c()
    if (i != split_row && i != (split_row + 1)) {
      for (j in 5:length(final_box)) {
        if (final_box[i,j] == "0" || final_box[i,j] == "0-0" || final_box[i,j] == "") {
          played <- append(played, FALSE)
        } else {
          played <- append(played, TRUE)
          break
        }
      }
      if (length(which(played == TRUE)) == 0) {
        delete_row <- append(delete_row, i)
      }
    }
    # print(i)
  }
}

if (length(delete_row) > 0) {
  final_box <- final_box[-delete_row,]
}
colnames(final_box) <- append(c("", "Home Team (Gray)", colnames(final_box)[3]), vec)
#############################
##### Add to Powder.xlsx ###########
#write.xlsx(final_box, file = "Powder.xlsx", sheetName = paste0("0", args[3], "-", day, " G2"), append = TRUE)

len <- length(final_box$`Home Team (Gray)`)
split_row <- which(final_box$`Home Team (Gray)` == "")[2]
final_box[c(1:(split_row - 1)), 1] <- str_remove(colnames(final_box)[3], "Team.")
final_box[c((split_row + 2):len), 1] <- str_remove(final_box[split_row + 1, 3], "Team ")
colnames(final_box) <- final_box[1,]
colnames(final_box)[1] <- "team"
final_box <- final_box[-c(1, split_row, split_row + 1, split_row + 2),]
if ("TimeOuts" %in% colnames(final_box)) {
  final_box <- final_box[-c(which(colnames(final_box) == "TimeOuts"))]
}
final_box$home <- ids$team_id[which(ids$team == final_box$team[1])]
final_box$away <- ids$team_id[which(ids$team == final_box$team[length(final_box$team)])]
for (i in 1:length(final_box$team)) {
  final_box$team_id[i] <- ids$team_id[which(ids$team == final_box$team[i])]
}
final_box$game_id <- game_num
final_box$time <- "8:30 PM"
final_box$date <- paste0(args[3], "/", args[1], "/22")
final_box$player_id <- ifelse(final_box$`#`=="Total:", "", tolower(paste0(final_box$First, final_box$Last, "_01")))
final_box$winner <- ids$team_id[which(ids$team == winner)]
for (i in 1:length(final_box$date)) {
  if (final_box$`#`[i]=="Total:") {
    final_box$g[i] <- ""
  } else {
    if (length(which(master_box$player_id == final_box$player_id[i])) > 0) {
      final_box$g[i] <- as.numeric(max(master_box[which(master_box$player_id == final_box$player_id[i]),]$g)) + 1
    } else {
      final_box$g[i] <- 1
    }
  }
}
if ("FG" %in% colnames(final_box)) {
  final_box$fga <- sub(".*-(.*)", "\\1", final_box$FG)
  final_box$fgm <- sub("(^[^-]+)-.*", "\\1", final_box$FG)
  final_box$`fg%` <- as.numeric(final_box$fgm) / as.numeric(final_box$fga)
}
if ("3PT" %in% colnames(final_box)) {
  final_box$`3pa` <- sub(".*-(.*)", "\\1", final_box$`3PT`)
  final_box$`3pm` <- sub("(^[^-]+)-.*", "\\1", final_box$`3PT`)
  final_box$`3p%` <- as.numeric(final_box$`3pm`) / as.numeric(final_box$`3pa`)
}
if ("FT" %in% colnames(final_box)) {
  final_box$fta <- sub(".*-(.*)", "\\1", final_box$FT)
  final_box$ftm <- sub("(^[^-]+)-.*", "\\1", final_box$FT)
  final_box$`ft%` <- as.numeric(final_box$ftm) / as.numeric(final_box$fta)
}
colnames(final_box) <- tolower(colnames(final_box))

if (!("winner" %in% colnames(final_box))) {
  final_box$winner <- NA
}
if (!("g" %in% colnames(final_box))) {
  final_box$g <- NA
}
if (!("gs" %in% colnames(final_box))) {
  final_box$gs <- NA
}
if (!("mp" %in% colnames(final_box))) {
  final_box$mp <- NA
}
if (!("pts" %in% colnames(final_box))) {
  final_box$pts <- NA
}
if (!("fga" %in% colnames(final_box))) {
  final_box$fga <- NA
}
if (!("fgm" %in% colnames(final_box))) {
  final_box$fgm <- NA
}
if (!("fg%" %in% colnames(final_box))) {
  final_box$`fg%` <- NA
}
if (!("3pa" %in% colnames(final_box))) {
  final_box$`3pa` <- NA
}
if (!("3pm" %in% colnames(final_box))) {
  final_box$`3pm` <- NA
}
if (!("3p%" %in% colnames(final_box))) {
  final_box$`3p%` <- NA
}
if (!("fta" %in% colnames(final_box))) {
  final_box$fta <- NA
}
if (!("ftm" %in% colnames(final_box))) {
  final_box$ftm <- NA
}
if (!("ft%" %in% colnames(final_box))) {
  final_box$`ft%` <- NA
}
if (!("oreb" %in% colnames(final_box))) {
  final_box$oreb <- NA
}
if (!("dreb" %in% colnames(final_box))) {
  final_box$dreb <- NA
}
if (!("treb" %in% colnames(final_box))) {
  final_box$treb <- NA
}
if (!("ast" %in% colnames(final_box))) {
  final_box$ast <- NA
}
if (!("stl" %in% colnames(final_box))) {
  final_box$stl <- NA
}
if (!("blk" %in% colnames(final_box))) {
  final_box$blk <- NA
}
if (!("tov" %in% colnames(final_box))) {
  final_box$tov <- NA
}
if (!("pf" %in% colnames(final_box))) {
  final_box$pf <- NA
}
colnames(master_box)[c(12, 19:22, 25)] <- c("#", "fg%", "3pa", "3pm", "3p%", "ft%")
master_col_order <- colnames(master_box)
final_box <- final_box[, master_col_order]
if (length(which(master_box$date == "")) > 0) {
  master_box <- master_box[-c(which(master_box$date == "")),]
}

master_box <- data.frame(rbind(master_box, final_box))
master_box[is.na(master_box)] <- ""

### Add to master.csv
write.csv(master_box, file = "Master.csv", row.names = FALSE)

# increase game id
game_num <- game_num + 1
saveRDS(game_num, "gameNum.rds")




############################################
#### GAME 3 ##############################
########################################
df <- list.files(pattern = paste0("G3 ", args[3], "-", args[1], "(.*)xlsm$"), path = paste0("Week", args[2], "/"))
if (length(df) > 0) {
  master_box <- read.csv("Master.csv")
  
  final_box <- data.frame(NA)
  for (i in 1:length(df)) {
    temp1 <- read_excel(paste0("Week", args[2], "/", df[i]))
    
    if (substr(df[i], 1, 2) == "FG") {
      if (as.numeric(temp1[2,1]) > as.numeric(temp1[2,3])) {
        winner <- str_remove(as.character(temp1[1,1]), "Team ")
      } else {
        winner <- str_remove(as.character(temp1[1,3]), "Team ")
      }
    }
    
    start_col <- which(colnames(temp1) == "Home Team (Gray)")
    if (start_col != 1) {
      temp1 <- temp1[-c(1:(start_col - 1))]
    }
    temp1 <- data.frame(cbind("", temp1))
    temp1[is.na(temp1)] <- ""
    box_start <- which(temp1[1,] == "#") + 1
    colnames(temp1)[box_start-1] <- "#"
    split_row <- which(temp1$Home.Team..Gray. == "")[2]
    temp1_p1 <- temp1[c(2:(split_row-2)),]
    temp1_p2 <- temp1[-c(1:(split_row+2), length(temp1$`#`)),]
    temp1_p1$`#` <- as.numeric(temp1_p1$`#`)
    temp1_p2$`#` <- as.numeric(temp1_p2$`#`)
    temp1_p1$`#`[is.na(temp1_p1$`#`)] <- 0
    temp1_p2$`#`[is.na(temp1_p2$`#`)] <- 0
    temp1_p1 <- temp1_p1 %>% 
      arrange(temp1_p1$`#`, temp1_p1[3], temp1_p1$Home.Team..Gray.)
    temp1_p2 <- temp1_p2 %>% 
      arrange(temp1_p2$`#`, temp1_p2[3], temp1_p2$Home.Team..Gray.)
    if ("MP" %in% temp1[1,]) {
      mp_spot <- which(temp1[1,] == "MP")
      colnames(temp1_p1)[mp_spot] <- "MP"
      colnames(temp1_p2)[mp_spot] <- "MP"
      temp1_p1$MP <- round(as.numeric(temp1_p1$MP), 1)
      temp1_p2$MP <- round(as.numeric(temp1_p2$MP), 1)
    }
    
    temp1[c(2:(split_row-2)),] <- temp1_p1
    temp1[c((split_row+3):(length(temp1$`#`) - 1)),] <- temp1_p2
    
    if (i == 1) {
      final_box <- data.frame(cbind(final_box, temp1))
      final_box <- final_box[,-c(1)]
    } else {
      final_box <- data.frame(cbind(final_box, temp1[,box_start:length(temp1)]))
    } 
    
    print(i)
  }
  if (length(which(final_box[1,] == "")) > 1) {
    final_box <- final_box[-which(final_box[1,] == "")[2:length(which(final_box[1,] == ""))]]
  }
  len <- length(colnames(final_box))
  vec <- c()
  for (i in 5:len) {
    vec <- append(vec, final_box[1, i])
    # final_box[1,i] <- ""
  }
  # final_box[1,4] <- ""
  colnames(final_box) <- append(c(".", "Home.Team..Gray.", colnames(final_box)[3], "#"), vec)
  pts <- c("PTS", "FG", "3PT", "FT")
  start <- c(".", "Home.Team..Gray.", colnames(final_box)[3], "#", "MP")
  reb <- c("OREB", "DREB", "TREB")
  other <- c("AST", "STL", "BLK", "TOV", "PF", "TimeOuts")
  col_order <- append(append(start[which(start %in% colnames(final_box))], pts[which(pts %in% colnames(final_box))]), 
                      append(reb[which(reb %in% colnames(final_box))], other[which(other %in% colnames(final_box))]))
  final_box <- final_box[, col_order]
  vec <- c()
  len <- length(final_box)
  for (i in 4:len) {
    vec <- append(vec, "")
    # final_box[1,i] <- ""
  }
  
  if ("MP" %in% final_box[1,]) {
    delete_row <- which(final_box$MP == "0")
  } else {
    delete_row <- c()
    for (i in 1:length(final_box$Home.Team..Gray.)) {
      played <- c()
      if (i != split_row && i != (split_row + 1)) {
        for (j in 5:length(final_box)) {
          if (final_box[i,j] == "0" || final_box[i,j] == "0-0" || final_box[i,j] == "") {
            played <- append(played, FALSE)
          } else {
            played <- append(played, TRUE)
            break
          }
        }
        if (length(which(played == TRUE)) == 0) {
          delete_row <- append(delete_row, i)
        }
      }
      # print(i)
    }
  }
  
  if (length(delete_row) > 0) {
    final_box <- final_box[-delete_row,]
  }
  colnames(final_box) <- append(c("", "Home Team (Gray)", colnames(final_box)[3]), vec)
  
  len <- length(final_box$`Home Team (Gray)`)
  split_row <- which(final_box$`Home Team (Gray)` == "")[2]
  final_box[c(1:(split_row - 1)), 1] <- str_remove(colnames(final_box)[3], "Team.")
  final_box[c((split_row + 2):len), 1] <- str_remove(final_box[split_row + 1, 3], "Team ")
  colnames(final_box) <- final_box[1,]
  colnames(final_box)[1] <- "team"
  final_box <- final_box[-c(1, split_row, split_row + 1, split_row + 2),]
  if ("TimeOuts" %in% colnames(final_box)) {
    final_box <- final_box[-c(which(colnames(final_box) == "TimeOuts"))]
  }
  final_box$home <- ids$team_id[which(ids$team == final_box$team[1])]
  final_box$away <- ids$team_id[which(ids$team == final_box$team[length(final_box$team)])]
  for (i in 1:length(final_box$team)) {
    final_box$team_id[i] <- ids$team_id[which(ids$team == final_box$team[i])]
  }
  final_box$game_id <- game_num
  final_box$time <- "8:45 PM"
  final_box$date <- paste0(args[3], "/", args[1], "/22")
  final_box$player_id <- ifelse(final_box$`#`=="Total:", "", tolower(paste0(final_box$First, final_box$Last, "_01")))
  final_box$winner <- ids$team_id[which(ids$team == winner)]
  for (i in 1:length(final_box$date)) {
    if (final_box$`#`[i]=="Total:") {
      final_box$g[i] <- ""
    } else {
      if (length(which(master_box$player_id == final_box$player_id[i])) > 0) {
        final_box$g[i] <- as.numeric(max(master_box[which(master_box$player_id == final_box$player_id[i]),]$g)) + 1
      } else {
        final_box$g[i] <- 1
      }
    }
  }
  if ("FG" %in% colnames(final_box)) {
    final_box$fga <- sub(".*-(.*)", "\\1", final_box$FG)
    final_box$fgm <- sub("(^[^-]+)-.*", "\\1", final_box$FG)
    final_box$`fg%` <- as.numeric(final_box$fgm) / as.numeric(final_box$fga)
  }
  if ("3PT" %in% colnames(final_box)) {
    final_box$`3pa` <- sub(".*-(.*)", "\\1", final_box$`3PT`)
    final_box$`3pm` <- sub("(^[^-]+)-.*", "\\1", final_box$`3PT`)
    final_box$`3p%` <- as.numeric(final_box$`3pm`) / as.numeric(final_box$`3pa`)
  }
  if ("FT" %in% colnames(final_box)) {
    final_box$fta <- sub(".*-(.*)", "\\1", final_box$FT)
    final_box$ftm <- sub("(^[^-]+)-.*", "\\1", final_box$FT)
    final_box$`ft%` <- as.numeric(final_box$ftm) / as.numeric(final_box$fta)
  }
  colnames(final_box) <- tolower(colnames(final_box))
  
  if (!("winner" %in% colnames(final_box))) {
    final_box$winner <- NA
  }
  if (!("g" %in% colnames(final_box))) {
    final_box$g <- NA
  }
  if (!("gs" %in% colnames(final_box))) {
    final_box$gs <- NA
  }
  if (!("mp" %in% colnames(final_box))) {
    final_box$mp <- NA
  }
  if (!("pts" %in% colnames(final_box))) {
    final_box$pts <- NA
  }
  if (!("fga" %in% colnames(final_box))) {
    final_box$fga <- NA
  }
  if (!("fgm" %in% colnames(final_box))) {
    final_box$fgm <- NA
  }
  if (!("fg%" %in% colnames(final_box))) {
    final_box$`fg%` <- NA
  }
  if (!("3pa" %in% colnames(final_box))) {
    final_box$`3pa` <- NA
  }
  if (!("3pm" %in% colnames(final_box))) {
    final_box$`3pm` <- NA
  }
  if (!("3p%" %in% colnames(final_box))) {
    final_box$`3p%` <- NA
  }
  if (!("fta" %in% colnames(final_box))) {
    final_box$fta <- NA
  }
  if (!("ftm" %in% colnames(final_box))) {
    final_box$ftm <- NA
  }
  if (!("ft%" %in% colnames(final_box))) {
    final_box$`ft%` <- NA
  }
  if (!("oreb" %in% colnames(final_box))) {
    final_box$oreb <- NA
  }
  if (!("dreb" %in% colnames(final_box))) {
    final_box$dreb <- NA
  }
  if (!("treb" %in% colnames(final_box))) {
    final_box$treb <- NA
  }
  if (!("ast" %in% colnames(final_box))) {
    final_box$ast <- NA
  }
  if (!("stl" %in% colnames(final_box))) {
    final_box$stl <- NA
  }
  if (!("blk" %in% colnames(final_box))) {
    final_box$blk <- NA
  }
  if (!("tov" %in% colnames(final_box))) {
    final_box$tov <- NA
  }
  if (!("pf" %in% colnames(final_box))) {
    final_box$pf <- NA
  }
  colnames(master_box)[c(12, 19:22, 25)] <- c("#", "fg%", "3pa", "3pm", "3p%", "ft%")
  master_col_order <- colnames(master_box)
  final_box <- final_box[, master_col_order]
  if (length(which(master_box$date == "")) > 0) {
    master_box <- master_box[-c(which(master_box$date == "")),]
  }
  
  master_box <- data.frame(rbind(master_box, final_box))
  master_box[is.na(master_box)] <- ""
  
  ### Add to master.csv
  write.csv(master_box, file = "Master.csv", row.names = FALSE)
  
  # increase game id
  game_num <- game_num + 1
  saveRDS(game_num, "gameNum.rds")
}




#########################################################
####################################################
## Create player averages and upload json files ############# 
####################################################
####################################################
library(jsonlite)
library(dplyr)
rm(list = ls())

master <- read.csv(file = "Master.csv")
# master[is.na(master)] <- ""

# remove all star game
master <- master[-which(master$date == "7/23 Showcase"), ]
master <- master[-which(master$date == "8/9 Showcase"),]
# remove players who can't have stats
master <- master[-which(master$first == "Guest"),]


player <- data.frame(id = unique(master$player_id))
if (length(which(player$id == "")) > 0) {
  player <- data.frame(id = player[-c(which(player$id == "")),])  
}
if (length(which(player$id == "Stats")) > 0) {
  player <- data.frame(id = player[-c(which(player$id == "Stats")),])  
}
# player <- data.frame(id = player[-which(player$id == "festusndumanya_02"),])


for (i in 1:length(player$id)) {
  player$first[i] <- max(master$first[which(master$player_id == player$id[i])])
}
for (i in 1:length(player$id)) {
  player$last[i] <- max(master$last[which(master$player_id == player$id[i])])
}
for (i in 1:length(player$id)) {
  teams <- master$team[which(master$player_id == player$id[i])]
  if (length(teams) == 1) {
    player$team[i] <- teams[1]
  } else if (length(teams) > 1) {
    oneteam <- TRUE
    for (j in 1:length(teams)) {
      if (j > 1) {
        if (teams[j] != teams[j-1]) {
          oneteam <- FALSE
        }
      }
    }
    if (oneteam) {
      player$team[i] <- teams[1]
    } else {
      player$team[i] <- NA
    }
  } else {
    player$team[i] <- NA
  }
}
for (i in 1:length(player$id)) {
  player$g[i] <- max(master$g[which(master$player_id == player$id[i])])
}
for (i in 1:length(player$id)) {
  player$gs[i] <- max(master$gs[which(master$player_id == player$id[i])])
}
for (i in 1:length(player$id)) {
  player$mp[i] <- mean(master$mp[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$pts[i] <- mean(master$pts[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$fga[i] <- mean(master$fga[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$fgm[i] <- mean(master$fgm[which(master$player_id == player$id[i])], na.rm = TRUE)
}
player$`fg%` <- player$fgm / player$fga
for (i in 1:length(player$id)) {
  player$`3pa`[i] <- mean(master$X3pa[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$`3pm`[i] <- mean(master$X3pm[which(master$player_id == player$id[i])], na.rm = TRUE)
}
player$`3p%` <- player$`3pm` / player$`3pa`
for (i in 1:length(player$id)) {
  player$fta[i] <- mean(master$fta[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$ftm[i] <- mean(master$ftm[which(master$player_id == player$id[i])], na.rm = TRUE)
}
player$`ft%` <- player$ftm / player$fta
for (i in 1:length(player$id)) {
  player$oreb[i] <- mean(master$oreb[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$dreb[i] <- mean(master$dreb[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$treb[i] <- mean(master$treb[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$ast[i] <- mean(master$ast[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$stl[i] <- mean(master$stl[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$blk[i] <- mean(master$blk[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$tov[i] <- mean(master$tov[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$pf[i] <- mean(master$pf[which(master$player_id == player$id[i])], na.rm = TRUE)
}
for (i in 1:length(player$id)) {
  player$tot3[i] <- sum(master$X3pm[which(master$player_id == player$id[i])])
}
if (length(intersect(which(player$first == "?"), which(player$last == "?"))) > 0) {
  player <- player[-intersect(which(player$first == "?"), which(player$last == "?")),]  
}

### Build leaderboards
pts_leader <- player[which(player$g > 1),][with(player[which(player$g > 1),],order(-pts, -g)),][1:10,c(1:3, 8)]
mp_leader <- player[which(player$g >= 1),][with(player[which(player$g >= 1),],order(-mp, -g)),][1:10,c(1:3, 7)]
reb_leader <- player[which(player$g > 1),][with(player[which(player$g > 1),],order(-treb, -g)),][1:10,c(1:3, 20)]
ast_leader <- player[which(player$g > 1),][with(player[which(player$g > 1),],order(-ast, -g)),][1:10,c(1:3, 21)]
blk_leader <- player[which(player$g > 1),][with(player[which(player$g > 1),],order(-blk, -g)),][1:10,c(1:3, 23)]
stl_leader <- player[which(player$g > 1),][with(player[which(player$g > 1),],order(-stl, -g)),][1:10,c(1:3, 22)]
`fg%_leader` <- player[which(player$g > 1),][with(player[which(player$g > 1),],order(-`fg%`, -g)),][1:10,c(1:3, 9:11)]
# `fg%_leader` <- player[which(player$g >= 1),][with(player[which(player$g >= 1),],order(-`fg%`)),][1:10,c(1:3, 9:11)]
# `3p%_leader` <- player[which(player$`3pa` > 3),][with(player[which(player$`3pa` > 3),],order(-`3p%`)),][1:10,c(1:3, 12:14)]
p3int <- player[which((player$`3pa` * player$g) > 5),]
`3pm_leader` <- p3int[with(p3int,order(-tot3, -g)),][1:10,c(1:3, 26)]
`3p%_leader` <- p3int[with(p3int,order(-`3p%`, -g)),][1:10,c(1:3, 12:14)]
# `ft%_leader` <- player[which(player$fta > 2),][with(player[which(player$fta > 2),],order(-`ft%`)),][1:10,c(1:3, 15:17)]
# ftint <- player[intersect(which(player$g >= 1), which((player$fta * player$g) > 1)),]
ftint <- player[which((player$fta * player$g) >= 10),] %>% arrange(desc(fta))
`ft%_leader` <- ftint[with(ftint,order(-`ft%`, -g)),][1:10,c(1:3, 15:17)]

## Add player averages to player.csv
write.csv(player, "Player.csv", row.names = FALSE)

##Write jsons to sportsdada 

dates <- read.csv("game_dates.csv")

colnames(`fg%_leader`)[6] <- "fg"
colnames(`3p%_leader`)[6] <- "p3"
colnames(`ft%_leader`)[6] <- "ft"
colnames(master)[c(12, 19:22, 25)] <- c("num", "fgp", "thpa", "thpm", "thpp", "ftp")
colnames(player)[c(11:14, 17)] <- c("fgp", "thpa", "thpm", "thpp", "ftp")

player$mp <- round(as.numeric(player$mp), 1)
player$pts <- round(as.numeric(player$pts), 1)
player$treb <- round(as.numeric(player$treb), 1)
player$ast <- round(as.numeric(player$ast), 1)
player$fgp <- round((100* as.numeric(player$fgp)), 1)
player$thpp <- round((100* as.numeric(player$thpp)), 1)
player$ftp <- round((100* as.numeric(player$ftp)), 1)
player$oreb <- round(as.numeric(player$oreb), 1)
player$dreb <- round(as.numeric(player$dreb), 1)
player$stl <- round(as.numeric(player$stl), 1)
player$blk <- round(as.numeric(player$blk), 1)
player$fga <- round(as.numeric(player$fga), 1)
player$fgm <- round(as.numeric(player$fgm), 1)
player$thpa <- round(as.numeric(player$thpa), 1)
player$thpm <- round(as.numeric(player$thpm), 1)
player$fta <- round(as.numeric(player$fta), 1)
player$ftm <- round(as.numeric(player$ftm), 1)
player$tov <- round(as.numeric(player$tov), 1)
player$pf <- round(as.numeric(player$pf), 1)

player[is.na(player)] <- ""
player$team[which(player$team == "")] <- NA


team_data <- master[which(master$num=="Total:"),]

teams <- data.frame(team = unique(team_data$team))
teams$team_id <- unique(team_data$team_id)
winners <- team_data[which(team_data$team_id == team_data$winner),]
losers <- team_data[which(team_data$team_id != team_data$winner),]

for (i in 1:length(teams$team)) {
  home <- team_data[which(team_data$home == teams$team_id[i]),]
  away <- team_data[which(team_data$away == teams$team_id[i]),]
  teams$w[i] <- length(winners[which(winners$team_id == teams$team_id[i]),]$date)
  teams$l[i] <- length(losers[which(losers$team_id == teams$team_id[i]),]$date)
  teams$home[i] <- paste0(length(winners[which(winners$team_id == teams$team_id[i]),][which(winners[which(
    winners$team_id == teams$team_id[i]),]$home == winners[which(
      winners$team_id == teams$team_id[i]),]$team_id),]$date), "-", (length(home$date) / 2)-as.numeric(length(winners[which(winners$team_id == teams$team_id[i]),][which(winners[which(
        winners$team_id == teams$team_id[i]),]$home == winners[which(
          winners$team_id == teams$team_id[i]),]$team_id),]$date)))
  teams$away[i] <- paste0(length(winners[which(winners$team_id == teams$team_id[i]),][which(winners[which(
    winners$team_id == teams$team_id[i]),]$home != winners[which(
      winners$team_id == teams$team_id[i]),]$team_id),]$date), "-", (length(away$date) / 2)-as.numeric(length(winners[which(winners$team_id == teams$team_id[i]),][which(winners[which(
        winners$team_id == teams$team_id[i]),]$home != winners[which(
          winners$team_id == teams$team_id[i]),]$team_id),]$date)))
  
}
teams$pct <- round(as.numeric(teams$w) / (as.numeric(teams$w) + as.numeric(teams$l)), 2)
teams <- teams %>% arrange(desc(w), desc(pct))

for (i in 1:length(teams$team)) {
  teams$gb[i] <- ifelse(i == 1, 0, teams$l[i] - teams$l[1])
  opponents <- team_data[which(team_data$team_id != teams$team_id[i]),]
  teams$ppg[i] <- round(mean(team_data[which(team_data$team_id == teams$team_id[i]),]$pts, na.rm = TRUE), 1)
  teams$oppg[i] <- round(mean(data.frame(rbind(opponents[which(opponents$home == teams$team_id[i]),], 
                                    opponents[which(opponents$away == teams$team_id[i]),]))$pts, na.rm = TRUE), 1)
  teams$diff[i] <- round(as.numeric(teams$ppg[i]) - as.numeric(teams$oppg[i]), 1)
}

teams <- teams[, c(1, 3, 4, 7, 8, 5, 6, 9, 10, 11)]

team_stats <- data.frame(team = unique(team_data$team))
team_stats$team_id <- unique(team_data$team_id)
for (i in 1:length(team_stats$team)) {
  team_stats$ppg[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$pts, na.rm = TRUE), 1)
  team_stats$treb[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$treb, na.rm = TRUE), 1)
  team_stats$ast[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$ast, na.rm = TRUE), 1)
  team_stats$treb[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$treb, na.rm = TRUE), 1)
  team_stats$fga[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$fga, na.rm = TRUE), 1)
  team_stats$fgm[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$fgm, na.rm = TRUE), 1)
  team_stats$fgp[i] <- round(100 * (team_stats$fgm[i] / team_stats$fga[i]), 1)
  team_stats$thpa[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$thpa, na.rm = TRUE), 1)
  team_stats$thpm[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$thpm, na.rm = TRUE), 1)
  team_stats$thpp[i] <- round(100 * (team_stats$thpm[i] / team_stats$thpa[i]), 1)
  team_stats$fta[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$fta, na.rm = TRUE), 1)
  team_stats$ftm[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$ftm, na.rm = TRUE), 1)
  team_stats$ftp[i] <- round(100 * (team_stats$ftm[i] / team_stats$fta[i]), 1)
  team_stats$oreb[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$oreb, na.rm = TRUE), 1)
  team_stats$dreb[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$dreb, na.rm = TRUE), 1)
  team_stats$treb[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$treb, na.rm = TRUE), 1)
  team_stats$stl[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$stl, na.rm = TRUE), 1)
  team_stats$blk[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$blk, na.rm = TRUE), 1)
  team_stats$tov[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$tov, na.rm = TRUE), 1)
  team_stats$pf[i] <- round(mean(team_data[which(team_data$team_id == team_stats$team_id[i]),]$pf, na.rm = TRUE), 1)
}

master <- read.csv(file = "Master.csv")
colnames(master)[c(12, 19:22, 25)] <- c("num", "fgp", "thpa", "thpm", "thpp", "ftp")

write_json(pts_leader, "../back-end/pts.json")
write_json(ast_leader, "../back-end/ast.json")
write_json(reb_leader, "../back-end/reb.json")
write_json(blk_leader, "../back-end/blk.json")
write_json(stl_leader, "../back-end/stl.json")
write_json(mp_leader, "../back-end/mp.json")
write_json(`3pm_leader`, "../back-end/thtot.json")
write_json(`3p%_leader`, "../back-end/pth.json")
write_json(`fg%_leader`, "../back-end/fg.json")
write_json(`ft%_leader`, "../back-end/ft.json")
write_json(player, "../back-end/players.json")
write_json(dates, "../back-end/game_dates.json")
write_json(master, "../back-end/master.json")
write_json(teams, "../back-end/teams.json")
write_json(team_stats, "../back-end/team_stats.json")





















