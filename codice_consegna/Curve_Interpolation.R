library(gdxtools)
igdx("/Library/Frameworks/GAMS.framework/Versions/42/Resources")

library(polynom)
library(ggplot2)
library(ggpubr)
library(collapse)
library(tidyverse)
library(broom)


############################
############################
### LITHIUM SUPPLY CURVE
### LITHIUM PRODUCTION (2005-2021)

library(readxl)
Litio = read_excel('lithium_excel.xlsx')


country  <- Litio[1:19,1]
data <-Litio[1:18,15:32] # Lithium production of WITCH regions from 2005
GlobalPrice <- Litio[19,15:32]


library(data.table)
setDT(data)[,names(data):=Reduce("+",data,accumulate=TRUE)]
head(data)

# Add Price per year
data1 = rbind(data,GlobalPrice)
# Add Country names
data1 <- cbind(country,data1)
lithium <-  data1[,-1]
rownames(lithium) <- data1[,1]

# transpose the dataframe
lithium <- as.data.frame(t(lithium))

############################
## LITHIUM Curve Interpolation

# Create a vector of column names to loop through (removing Price)
cols <- head(names(lithium),-1)

# Initialize an empty data frame to store the intercepts and slopes
results <- data.frame(intercept = numeric(length(cols)), 
                      slope = numeric(length(cols)), 
                      coef2 = numeric(length(cols)),
                      row.names = cols)


# Loop through each Country and fit a linear regression model
for (col in cols) {
  # Extract the column as the predictor variable
  x <- lithium[[col]]
  # Fit the linear regression model using the predictor variable 
  # and the Price variable as the response variable
  
  model <- lm(Price ~ I(x^4), data = lithium) 

  # Store the intercept and slope in the results data frame
  results[col, "intercept"] <- coef(model)[1]
  results[col, "slope"] <- coef(model)[2]
}


# View the results
results
setDT(results, keep.rownames = TRUE)[]
colnames(results)[1] <- "Region"

results <- results [1:17,]

#create the GDX file
trade_poly_lithium = data.frame(n= c('canada','europe','jpnkor',"mexico","oceania","usa","brazil","china","india","indonesia", "laca","mena","southafrica","sasia","seasia","ssa", "te"),
                    deg0 = results$intercept,
                    deg1 = results$slope)

dataset <- trade_poly_lithium %>% pivot_longer(cols=!n)
head(dataset)

mod_lit <- data.frame(dataset[2],dataset[1],dataset[3])
head(mod_lit)

write.gdx("data_mod_lithium.gdx",list(trade_poly_lit=mod_lit), compress=F)
