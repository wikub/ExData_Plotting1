## PLOT 1
## Script in "ExData_Plotting1" directory with data file
library(datasets)
library(dplyr)


ElecPowerConsu <- read.csv(file = "household_power_consumption.txt", sep = ";")
ElecPowerConsuSelect <- filter(ElecPowerConsu, ElecPowerConsu$Date %in% c("1/2/2007","2/2/2007"))
ElecPowerConsuSelect <- mutate(ElecPowerConsuSelect, Global_active_power = as.numeric(sub(",",".",Global_active_power)))

par(mfrow = c(1, 1))

hist(
    ElecPowerConsuSelect$Global_active_power,
    col = "red",
    xlab = "Global Active Power (kilowatts)",
    main = "Global Active Power"
)

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()