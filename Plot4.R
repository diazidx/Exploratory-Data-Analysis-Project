## lattice
library(lattice)

## read source
data01 <- readRDS("summarySCC_PM25.rds")
classification <- readRDS("Source_Classification_Code.rds")

## getting all data related with coal and sum
coalclass <- classification[grepl("Coal", classification$Short.Name), ]
coaldata01 <- data01[data01$SCC %in% coalclass$SCC, ]
emyear <- aggregate(coaldata01$Emissions, by=list(coaldata01$year), FUN=sum)
colnames(emyear) <- c("year", "emissions")

## creting plot using lattice system
png(filename = "plot4.png")
xyplot(emissions ~ year, data = emyear, type = "l", xlab = "Year", ylab = "Total (tons)", main = "Coal Emissions Nationwide by Year")
dev.off()