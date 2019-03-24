##loading ggplot library
library(ggplot2)

## read source
data01 <- readRDS("summarySCC_PM25.rds")

## subsetting data from baltimore and sum by type and year
databalt <- subset(data01, data01$fips=="24510")
databalt_ty <- aggregate(databalt$Emissions, by=list(databalt$type, databalt$year), FUN=sum)
colnames(databalt_ty) <- c("Type", "Year", "Emissions")

## protting with ggplot
png(filename = "plot3.png")
qplot(Year, Emissions, data = databalt_ty, color = Type, geom = "line", main = "Total Emissions of PM2.5 in Baltimore City By type", ylab = "Total (tons)", xlab = "Year")
dev.off()