# Plot 4
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
df1$Voltage <- df1$Voltage %>% as.numeric()
df1$Global_reactive_power <- df1$Global_reactive_power %>% as.numeric()
df1[c(7:9)] = sapply(df1[c(7:9)],as.numeric) #submettering variables

# Set device to png and file name
png(filename = 'plot4.png')
par(mfrow=c(2,2))


# Plot 1
plot(df1$datetime,df1$Global_active_power,type='l',
     ylab = 'Global Active Power (kilowatts)',
     xlab = '')

# plot 2
plot(df1$datetime,df1$Voltage,type='l',
     ylab = 'Voltage',xlab = 'datetime')


# Plot 3
## convert relevant columns to numeric

plot(df1$datetime,df1$Sub_metering_1,type='l',ylab = 'Energy sub metering',xlab = '')
lines(df1$datetime,df1$Sub_metering_2,type='l',col='red')
lines(df1$datetime,df1$Sub_metering_3,type='l',col='blue')
legend('topright',legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c('black','red','blue'),lty = 1,cex=.5, xjust = 1)


# Plot 4

plot(df1$datetime,df1$Global_reactive_power,type='l',
     ylab = 'Global_reactive_power',xlab = 'datetime')

dev.off()
