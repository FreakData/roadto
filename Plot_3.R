# importing  dataset 
library(readr)
data <- read_delim("C:/Users/cauma/Desktop/household_power_consumption.txt", 
                   ";", escape_double = FALSE, trim_ws = TRUE)


# variable conversion  to date format 
data$Date = as.Date(data$Date, format="%d/%m/%Y")

# selecting data from the dates 2007-02-01 and 2007-02-02 to newdata 
newdata = subset(data,data$Date >= "2007-02-01" & data$Date <= "2007-02-02")



# converting Date and Time to Date/Time 

Date_Time = paste(as.Date(newdata$Date), newdata$Time)
newdata$Date_Time <- as.POSIXct(Date_Time)

#strptime ? 


# Plot N°3 
plot(newdata$Sub_metering_1~newdata$Date_Time, 
       type="l",
      xlab="",
       ylab="Global Active Power (kilowatts)")
lines(newdata$Sub_metering_2~newdata$Date_Time,
      col='Red')
lines(newdata$Sub_metering_3~newdata$Date_Time,
      col='Blue')
legend("topright", col=c("black", "red", "blue"), 
       lty=1, 
       lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))




# Saving the hist to a png 480 x 480
dev.copy(png, file="C:/Users/cauma/Desktop/Plot_3.png", height=480, width=800) # we don't see all legend with width 480 so i put 800 for vision i can put 480 but
dev.off()
