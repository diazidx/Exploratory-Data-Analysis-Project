## lattice
library(lattice)

## read source
data01 <- readRDS("summarySCC_PM25.rds")

## subsetting data type "ON ROAD" (car emissions) and from baltimore city
databalt <- subset(data01, fips=="24510" & type=="ON-ROAD")
databalty <- aggregate(databalt$Emissions, by=list(databalt$year), FUN=sum)
colnames(databalty) <- c("Year", "Emissions")

## creting plot using lattice system
png(filename = "plot5.png")
xyplot(Emissions ~ Year, data = databalty, type = "l", xlab = "Year", ylab = "Total (tons)", main = "Car Emissions in Baltimore by Year")
dev.off()