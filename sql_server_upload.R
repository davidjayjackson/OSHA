## Upload OHSA data in one large chuck
## 2022-05-30
library(DBI)
library(odbc)
library(ggplot2)
library(scales)
library(tidyverse)
library(janitor)

##
rm(list=ls())



## https://db.rstudio.com/databases/microsoft-sql-server/
con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "localhost\\SQLEXPRESS", 
                      Database = "Kaggle", 
                      Trusted_Connection = "True")

# dbListTables(con)

##  OSHA 2016 data

USA2016 <-read_csv("./Data/ITA Data CY 2016.csv") %>%
  select(company_name:year_filing_for)
USA2016 <- USA2016 %>% janitor::clean_names()
USA2016 <- USA2016 %>% janitor::remove_empty(which = c("rows","cols"))


dbWriteTable(con, "OSHA2016",USA2016 ,overwrite=TRUE)

##  OSHA 2017 data

USA2017 <-read_csv("./Data/ITA Data CY 2017.csv") %>%
  select(company_name:year_filing_for)
USA2017 <- USA2017 %>% janitor::clean_names()
USA2017 <- USA2017 %>% janitor::remove_empty(which = c("rows","cols"))


dbWriteTable(con, "OSHA2017",USA2017 ,overwrite=TRUE)


##  OSHA 2018 data: Problem??

USA2018 <-read_csv("./Data/ITA Data CY 2018.csv") %>%
  select(company_name:year_filing_for)
USA2018 <- USA2018 %>% janitor::clean_names()
USA2018 <- USA2018 %>% janitor::remove_empty(which = c("rows","cols"))


dbWriteTable(con, "OSHA2018",USA2018 ,overwrite=TRUE)

##  OSHA 2019 data

USA2019 <-read_csv("./Data/ITA Data CY 2019.csv") %>%
  select(company_name:year_filing_for)
USA2019 <- USA2019 %>% janitor::clean_names()
USA2019 <- USA2019 %>% janitor::remove_empty(which = c("rows","cols"))


dbWriteTable(con, "OSHA2019",USA2019 ,overwrite=TRUE)

##  OSHA 2020 data

USA2020 <-read_csv("./Data/ITA Data CY 2020.csv") %>%
  select(company_name:year_filing_for)
USA2020 <- USA2020 %>% janitor::clean_names()
USA2020 <- USA2020 %>% janitor::remove_empty(which = c("rows","cols"))


dbWriteTable(con, "OSHA2020",USA2020 ,overwrite=TRUE)

##  OSHA 2021 data

USA2021 <-read_csv("./Data/ITA Data CY 2021 .csv") %>%
  select(company_name:year_filing_for)
USA2021 <- USA2021 %>% janitor::clean_names()
USA2021 <- USA2021 %>% janitor::remove_empty(which = c("rows","cols"))


dbWriteTable(con, "OSHA2021",USA2021 ,overwrite=TRUE)
