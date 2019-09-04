
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Subset coal combustion related NEI data
combdf <- grepl("comb", SCC$SCC.Level.One, ignore.case=T)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=T) 
coalCombustion <- (combdf & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

library(ggplot2)

p4 <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill=factor(combustionNEI$year),width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))+
  theme(text = element_text(size=40))

ggsave('Plot4.png', p4, width = 100, height = 50, units='cm')