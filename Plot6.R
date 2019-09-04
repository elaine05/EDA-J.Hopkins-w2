NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehi<- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiSCC <- SCC[vehi,]$SCC
vehiNEI <- NEI[NEI$SCC %in% vehiSCC,]
vehiclesBaltimoreNEI <- vehiNEI[vehiNEI$fips == 24510,]
vehiclesBaltimoreNEI$city <- "Baltimore City"
vehiclesLANEI <- vehiNEI[vehiNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"
dfboth <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)


library(ggplot2)

p6 <- ggplot(dfboth, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))+
  theme(text = element_text(size=40))


  
ggsave('Plot6.png', p6, width = 120, height = 60, units='cm')