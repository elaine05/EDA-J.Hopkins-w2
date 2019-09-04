library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
balti <- NEI[NEI$fips=="24510",]
p3 <- ggplot(balti,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_dark()+ guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 group Source Type"))

ggsave('Plot3.png', p3, width = 40, height = 30, units='cm')