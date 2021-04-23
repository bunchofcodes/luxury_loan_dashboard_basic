library(shiny)
library(shinydashboard)
library(tidyverse)
library(DT)
library(plotly)
library(callr)
library(naniar)
library(tidyr)
library(ggplot2)
library(dplyr)
library(shinythemes)
library(dplyr)
library(lubridate)
library(RColorBrewer)

df = read.csv(file = "loan_ready.csv")
head(df)

# purpose jadi factor dan funded_date jadi date
df <- df %>% 
  mutate(purpose = as.factor(purpose),
         funded_date = ymd(funded_date))

