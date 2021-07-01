# Plot 1
# Week1 project
library(lubridate)
library(tidyverse)
len = length
intable = read.table('household_power_consumption.txt',header = T,sep = ';')
df = tbl_df(intable)
df= df %>% filter(Date %in% c('1/2/2007','2/2/2007'));df
df1 = df %>% mutate(datetime = strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S"))

# Convert global active power to numeric
df1$Global_active_power <- df1$Global_active_power %>% as.numeric()

# Set device to png and file name
png(filename = 'plot1.png')

# Plot 1
par(mfrow=c(1,1))
hist(df1$Global_active_power,col='red',main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

dev.off()
