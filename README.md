# [GroupID] Home Runs
The goals of this project.

## Contributors
|組員|系級|學號|工作分配|
|-|-|-|-|
|李元佑|資科專一|112971002|整理資料,寫程式,報告| 
|區仁豪|資科專一|112971010|提供資料參考|

## Quick start
Please provide an example command or a few commands to reproduce your analysis, such as the following R script:
```R
```

## Folder organization and its related description
project
│── img
├── code
│
├── data
│
├── docs
│
└── results
    └── README


### docs
* Your presentation, 1122_DS-FP_groupID.ppt/pptx/pdf (i.e.,1122_DS-FP_group1.ppt), by **06.06**
* Any related document for the project, i.e.,
  * discussion log
  * software user guide

### data
* Input
  * Source
  * Format
  * Size

### code
* Analysis steps 使用線性回歸模型
* Which method or package do you use?
library(rvest)
library(dplyr)
library(stringr)
library(readr)

* How do you perform training and evaluation?
使用2023以前的這六個特徵來做線性回歸模型
年份: Year
全壘打數: HR (Home Runs)
打數: AB (At Bats)
安打數: H (Hits)
長打率: SLG (Slugging Percentage)
每全壘打打數: AB/HR (At Bats per Home Run)
三振/四壞比: K/BB (Strikeouts per Walk)
* What is a null model for comparison?
使用2023年以前球員的資料來做預測全壘打數
### results
* What is your performance? 
"預測ShoheiOtani 2024年的全壘打支數:  42.9657247321123"
* Is the improvement significant?

## References
* Packages you use
library(rvest)
library(dplyr)
library(stringr)
library(readr)
* Related publications
https://www.baseball-almanac.com/yearly/top25.php?s=HR&l=NL&y=2024
