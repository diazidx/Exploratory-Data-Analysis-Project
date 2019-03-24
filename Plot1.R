## read source
data01 <- readRDS("summarySCC_PM25.rds")

## sum emission by year nationwide
sumyear <- aggregate(data01$Emissions, by=list(year=data01$year), FUN=sum)

## protting using base system
png(filename = "plot1.png")
plot(sumyear$year, sumyear$x, type = "l", main = "Total Emissions of PM2.5", ylab = "Total (tons)", xlab = "Year", col = "red")
dev.off()