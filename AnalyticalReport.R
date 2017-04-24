# An Analytical Crimes Report
mvt = read.csv("mvtWeek1.csv")
srt(mvt)
summary(mvt)
which.max(mvt$ID)
mvt$ID[18134]
which.min(mvt$Beat)
mvt$Beat[4756]
top5=subset(mvt, LocationDescription=="STREET" | LocationDescription=="PARKING LOT/GARAGE(NON.RESID.)" | LocationDescription=="ALLEY" | LocationDescription=="GAS STATION" | LocationDescription=="DRIVEWAY - RESIDENTIAL")
top5$LocationDescription = factor(top5$LocationDescription)
str(top5)
table(top5$LocationDescription, top5$Arrest)
table(top5$Weekday, top5$LocationDescription=="Gas Station")
table(top5$Weekday, top5$LocationDescription)