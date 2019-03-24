## lattice
library(lattice)

## read source
data01 <- readRDS("summarySCC_PM25.rds")

## subsetting data type "ON ROAD" (car emissions) from baltimore city and Los Angeles
datacombined <- subset(data01, fips=="24510" | fips=="06037" & type=="ON-ROAD")
datacombinedy <- aggregate(datacombined$Emissions, by=list(datacombined$fips,datacombined$year), FUN=sum)
colnames(datacombinedy) <- c("City", "Year", "Emissions")

## creting plot using lattice system
png(filename = "plot6.png")
xyplot(Emissions ~ Year, group = City, data = datacombinedy, type = "l", xlab = "Year", ylab = "Total (tons)", main = "Car Emissions in Baltimore (24510) and LA (06037) by Year", auto.key = list(space="top", columns=2, title="Cities", cex.title=1 ,lines=TRUE, points=FALSE))
dev.off()