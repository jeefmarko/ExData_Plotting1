# Plot 3
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
png(filename = 'plot3.png')

# Plot 3
## convert relevant columns to numeric
par(mfrow=c(1,1))
df1[c(7:9)] = sapply(df1[c(7:9)],as.numeric)
plot(df1$datetime,df1$Sub_metering_1,type='l',ylab = 'Energy sub metering',xlab = '')
lines(df1$datetime,df1$Sub_metering_2,type='l',col='red')
lines(df1$datetime,df1$Sub_metering_3,type='l',col='blue')
legend('topright',legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c('black','red','blue'),lty = 1,cex=.5, xjust = 1)

dev.off()
