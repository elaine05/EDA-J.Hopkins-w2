## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

df <- aggregate(Emissions ~ year,NEI, sum)
png('Plot1.png')
barplot(
  (df$Emissions)/10^6,
  names.arg=df$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources from 1999 to 2008"
)
dev.off()

