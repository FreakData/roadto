# importing  dataset 
library(readr)
data <- read_delim("C:/Users/cauma/Desktop/household_power_consumption.txt", 
                   ";", escape_double = FALSE, trim_ws = TRUE)

# variable Date to data format 
data$Date = as.Date(data$Date, format="%d/%m/%Y")



# selecting data from the dates 2007-02-01 and 2007-02-02 to newdata 

newdata = subset(data,data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

# Plot N°1 
hist(newdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red")

# Saving the hist to a png 480 x 480
dev.copy(png, file="C:/Users/cauma/Desktop/Plot_1.png", height=480, width=480)
dev.off()
