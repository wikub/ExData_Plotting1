## PLOT 2
## Script in "ExData_Plotting1" directory with data file
library(datasets)
library(dplyr)


ElecPowerConsu <- read.csv(file = "household_power_consumption.txt", sep = ";")
ElecPowerConsuSelect <- filter(ElecPowerConsu, Date %in% c("1/2/2007","2/2/2007")) %>% mutate(datetime = paste(Date, Time))

ElecPowerConsuSelect$datetime <- strptime(ElecPowerConsuSelect$datetime , format="%d/%m/%Y %H:%M:%S")

ElecPowerConsuSelect <- mutate(ElecPowerConsuSelect, Global_active_power = as.numeric(sub(",",".",Global_active_power)))

par(mfrow = c(1, 1))

with(ElecPowerConsuSelect,
    plot(
        datetime,
        as.numeric(sub(",",".",Sub_metering_1)),
        type = "l",
        ylab="Energy Submetering",
        xlab = "",
        main = "",
        ylim = c(0,35)
    )
)
with(ElecPowerConsuSelect, lines(datetime, as.numeric(sub(",",".",Sub_metering_2)), type = "l", col = "red"))
with(ElecPowerConsuSelect, lines(datetime, as.numeric(sub(",",".",Sub_metering_3)), type = "l", col = "blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()