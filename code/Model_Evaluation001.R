# 載入必要的R包
library(dplyr)

# 建立數據框
data <- data.frame(
  Year = c(2018, 2019, 2020, 2021, 2022, 2023, 2024),
  HR = c(22, 18, 7, 46, 34, 44, 15),
  AB = c(326, 384, 153, 537, 586, 497, 234),
  H = c(93, 110, 29, 138, 160, 151, 75),
  SLG = c(0.564, 0.505, 0.366, 0.592, 0.519, 0.654, 0.590),
  AB_HR = c(14.8, 21.3, 21.9, 11.7, 17.2, 11.3, 16.7),
  K_BB = c(2.86, 21.3, 0.38, 3.55, 4.98, 3.12, 16.7)
)

# 建立線性回歸模型（不包括2024年的數據）
train_data <- data %>% filter(Year < 2024)
model <- lm(HR ~ AB + H + SLG + AB_HR + K_BB, data = train_data)

# 檢視模型摘要
summary(model)

# 計算2024年已經進行的比賽數
played_games_2024 <- 59  # 替換為實際已經打的比賽數

# 計算2024年剩餘的比賽數
remaining_games_2024 <- 162 - played_games_2024

# 預測2024年全壘打支數
test_data_2024 <- data %>% filter(Year == 2024) %>% select(-HR)
predicted_hr_rate <- predict(model, newdata = test_data_2024) / played_games_2024  # 每場比賽的全壘打率
predicted_hr_2024 <- predicted_hr_rate * remaining_games_2024 + data$HR[data$Year == 2024]

# 更新2024年的全壘打數據
data$HR[data$Year == 2024] <- predicted_hr_2024

# 打印預測結果
print(paste("預測2024年的全壘打支數:", predicted_hr_2024))

# 定義評估函數來比較實際和預測的HR數量
evaluate_model <- function(actual, predicted) {
  # Mean Squared Error
  mse <- mean((actual - predicted) ^ 2)
  # Root Mean Squared Error
  rmse <- sqrt(mse)
  # R-squared
  ss_total <- sum((actual - mean(actual)) ^ 2)
  ss_res <- sum((actual - predicted) ^ 2)
  r_squared <- 1 - (ss_res / ss_total)
  
  return(list(MSE = mse, RMSE = rmse, R_squared = r_squared))
}

# 比較模型預測和實際HR（不包括2024年的評估）
actual_hr <- train_data$HR
predicted_hr <- predict(model, newdata = train_data)

# 評估模型
evaluation <- evaluate_model(actual_hr, predicted_hr)
print("Model Evaluation:")
print(evaluation)

# 將結果輸出為CSV文件
evaluation_data <- data.frame(
  指標 = c("MSE", "RMSE", "R_squared"),
  值 = unlist(evaluation)
)

# 輸出為CSV文件
write.csv(evaluation_data, "results/model_evaluation_results.csv001", row.names = FALSE)

