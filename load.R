install.packages("bigrquery")

library(bigrquery)
library(tidyverse)

bq_auth(scopes = "https://www.googleapis.com/auth/bigquery")

# If authentication is an issue this function reset the authentication
# bq_deauth()

billing <- "mpg-wildlife-insights"

#########################################################################################
############################ LOAD MLWIC INSIGHTS TABLE ##################################
#########################################################################################

sql_mlwic <- "SELECT *
               FROM `mpg-wildlife-insights.mlwic2_summaries.mlwic_dashboard` LIMIT 100"
bq_mlwic <- bq_project_query(billing, sql_mlwic)
tb_mlwic <- bq_table_download(bq_mlwic)
df_mlwic <- as.data.frame(tb_mlwic)

df_mlwic %>% glimpse()

#########################################################################################
############################ LOAD WILDLIFE INSIGHTS TABLE ###############################
#########################################################################################

sql_wi <- "SELECT *
           FROM `mpg-wildlife-insights.wi_summaries.wi_dashboard`
           LIMIT 100"
bq_wi <- bq_project_query(billing, sql_wi)
tb_wi <- bq_table_download(bq_wi)
df_wi <- as.data.frame(tb_wi)

df_wi %>% glimpse()