library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehi<- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiSCC <- SCC[vehi,]$SCC
vehiNEI <- NEI[NEI$SCC %in% vehiSCC,]
baltimoreVehiclesNEI <- vehiNEI[vehiNEI$fips==24510,]
p5  <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill=factor(baltimoreVehiclesNEI$year),width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))+
  theme(text = element_text(size=40))
ggsave('Plot5.png', p5, width = 100, height = 30, units='cm')