# Monte Carlo Simulation: Home Run King Probability

set.seed(123)

# 建立候選球員與預測全壘打數
players <- data.frame(
  Player = c(
    "Shohei Ohtani",
    "Aaron Judge",
    "Pete Alonso",
    "Vladimir Guerrero Jr.",
    "Ronald Acuna Jr."
  ),
  Pred_HR = c(45, 40, 38, 36, 34),
  Error_SD = c(4, 5, 4, 4, 4)
)

# 模擬次數
n_sim <- 10000

# 儲存每次模擬的全壘打王
winner <- character(n_sim)

# 開始模擬
for (i in 1:n_sim) {
  
  simulated_hr <- rnorm(
    n = nrow(players),
    mean = players$Pred_HR,
    sd = players$Error_SD
  )
  
  winner[i] <- players$Player[which.max(simulated_hr)]
}

# 統計每位球員成為全壘打王的次數與機率
prob_table <- as.data.frame(table(winner))

colnames(prob_table) <- c("Player", "Win_Count")

prob_table$Probability <- prob_table$Win_Count / n_sim

prob_table <- prob_table[order(-prob_table$Probability), ]

# 顯示結果
print(prob_table)

