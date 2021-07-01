# Plot 2
# Week1 project
library(lubridate)
library(tidyverse)
len = length
intable = read.table('household_power_consumption.txt',header = T,sep = ';')
df = tbl_df(intable)
df= df %>% filter(Date %in% c('1/2/2007','2/2/2007'))
df1 = df %>% mutate(datetime = strptime(paste(df$Date,df$Time),
                                        "%d/%m/%Y %H:%M:%S"))

# Convert global active power to numeric
df1$Global_active_power <- df1$Global_active_power %>% as.numeric()

# Set device to png and file name
png(filename = 'plot2.png')

# Plot 2
par(mfrow=c(1,1))
plot(df1$datetime,df1$Global_active_power,type='l',
     ylab = 'Global Active Power (kilowatts)',
     xlab = '')
dev.off()
