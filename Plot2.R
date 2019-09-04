NEI <- readRDS("summarySCC_PM25.rds")

balti <- NEI[NEI$fips=="24510",]
dfb <- aggregate(Emissions ~ year, balti, sum)
png('Plot2.png')
barplot(
  dfb$Emissions,
  names.arg=dfb$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)
dev.off()