## PLOT 2
## Script in "ExData_Plotting1" directory with data file
library(datasets)
library(dplyr)


ElecPowerConsu <- read.csv(file = "household_power_consumption.txt", sep = ";")
ElecPowerConsuSelect <- filter(ElecPowerConsu, Date %in% c("1/2/2007","2/2/2007")) %>% mutate(datetime = paste(Date, Time))

ElecPowerConsuSelect$datetime <- strptime(ElecPowerConsuSelect$datetime , format="%d/%m/%Y %H:%M:%S")

ElecPowerConsuSelect <- mutate(ElecPowerConsuSelect, Global_active_power = as.numeric(sub(",",".",Global_active_power)))

par(mfrow = c(1, 1))

plot(
    ElecPowerConsuSelect$datetime,
    ElecPowerConsuSelect$Global_active_power,
    type = "l",
    ylab = "Global Active Power (kilowatts)",
    xlab = "",
    main = ""
)

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()