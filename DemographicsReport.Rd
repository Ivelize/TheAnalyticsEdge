#Demographics and Employment in the United States

cps = read.csv("CPSData.csv")
str(cps)
summary(cps)
table(cps$Industry)
sort(table(cps$Region))
sort(table(cps$State))
table(cps$Hispanic, cps$Race)
table(cps$Region, is.na(cps$Married))
table(cps$Sex, is.na(cps$Married))
table(cps$Age, is.na(cps$Married))
table(cps$State, is.na(cps$MetroAreaCode))
#Which state has a proportion of interviewees living in a non-metropolitan area closest to 30%?
#Which state has the largest proportion of non-metropolitan interviewees, ignoring states where #all interviewees were non-metropolitan?
tapply(is.na(cps$MetroAreaCode), cps$State, mean)
#Integrating Metropolitan Area Data
metroareacode = read.csv("MetroAreaCodes.csv")
countrycode = read.csv("CountryCodes.csv")
#How many observations (codes for metropolitan areas) are there in MetroAreaMap and CountryCodes?
str(metroareacode)
str(countrycode)
sort(summary(cps$MetroArea))
cps = merge(cps, metroareacode, by.x="MetroAreaCode", by.y="Code", all.x=TRUE)
sort(tapply(cps$Race == "Asian", cps$MetroArea, mean))
sort(tapply(cps$Education == "No high school diploma", cps$MetroArea, mean, na.rm=TRUE))
# Integrating Country of Birth Data
cps = merge(cps, countrycode, by.x="CountryOfBirthCode", by.y="Code", all.x=TRUE)
#What proportion of the interviewees from the "New York-Northern New Jersey-Long Island, NY-NJ-#PA" metropolitan area have a country of birth that is not the United States?
table(cps$MetroArea == "New York-Northern New Jersey-Long Island, NY-NJ-PA", cps$Country !="United States")
#Which metropolitan area has the largest number of interviewees with a country of birth in Brazil?
sort(tapply(cps$Country=="Brazil", cps$MetroArea, mean, na.rm=TRUE))