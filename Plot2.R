## read source
data01 <- readRDS("summarySCC_PM25.rds")

## subsetting data from baltimore and then summing  by year
databalt <- subset(data01, fips=="24510")
databalty <- aggregate(databalt$Emissions, by=list(databalt$year), FUN=sum)

## Protting using base system
png(filename = "plot2.png")
plot(databalty$Group.1, databalty$x, type = "l", main = "Total Emissions of PM2.5 in Baltimore City", xlab = "year", ylab = "Total (tons)", col = "red")
dev.off()