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


# Plot N°2 
plot(newdata$Global_active_power~newdata$Date_Time, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")



# Saving the hist to a png 480 x 480
dev.copy(png, file="C:/Users/cauma/Desktop/Plot_2.png", height=480, width=480)
dev.off()
