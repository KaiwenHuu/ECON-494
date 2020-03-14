gen firstsample = 1 if fiscalyear <= 2008
replace firstsample = 0 if fiscalyear > 2008

///cross validation

reg logpd ltd intangibleasset rev sales cogs randd capx ///
loggdp Realinterestrate Inflation i.gicindustries i.gicindustries#c.sealevelchange ///
i.gicindustries#i.firstsample#c.sealevelchange , cluster(firm)
/// compare this with first set (1993 to 2003) and second set (2004 to 2013)
/// may want to reduce the sample years

reg logpd ltd intangible rev cogs capx ///
loggdp realinterestrate inflation i.group#c.sealevelchange, cluster(firm)

reg return ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.group#c.sealevelchange, cluster(firm)

reg logpd c.ltd#i.firstsample c.intangible#i.firstsample c.rev#i.firstsample c.cogs#i.firstsample c.capx#i.firstsample ///
c.loggdp#i.firstsample c.Realinterestrate#i.firstsample c.Inflation#i.firstsample i.group#c.sealevelchange ///
i.group#i.firstsample#c.sealevelchange, cluster(firm)

reg logpd ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.industry#c.sealevelchange, cluster(firm)

reg logpd ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.subindustry#c.sealevelchange ///
i.subindustry#i.firstsample#c.sealevelchange, cluster(firm)

reg logpd ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.subindustry#c.sealevelchange, cluster(firm)

reg logpd ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.industry#c.sealevelchange ///
i.subindustry#i.firstsample#c.sealevelchange, cluster(firm)

eststo: quietly reg logpd ltd intangible rev cogs capx ///
loggdp realinterestrate inflation i.group#c.sealevelchange, cluster(firm)

eststo: quietly reg return ltd intangible rev cogs capx ///
loggdp realinterestrate inflation i.group#c.sealevelchange, cluster(firm)

eststo: quietly reg logpd ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.group#c.sealevelchange ///
i.group#i.firstsample#c.sealevelchange, cluster(firm)

eststo: quietly reg return ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.group#c.sealevelchange ///
i.group#i.firstsample#c.sealevelchange, cluster(firm)

eststo: quietly reg logpd ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.industry#c.sealevelchange, cluster(firm)

eststo: quietly reg logpd ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.industry#c.sealevelchange ///
i.industry#i.firstsample#c.sealevelchange, cluster(firm)

eststo: quietly reg logpd ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.subindustry#c.sealevelchange, cluster(firm)

eststo: quietly reg logpd ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.industry#c.sealevelchange ///
i.subindustry#i.firstsample#c.sealevelchange, cluster(firm)

esttab using ols.tex, se nocons drop(_cons) indicate("Macro Controls = loggdp realinterestrate inflation" ///
"Firm Controls = ltd intangible rev cogs capx") ///
title("PD ratio vs Sea-Level interacted with Industry dummy") ///
scalar("N_clust Clusters" "r2 R-squared") ///
note("The unit of observation is firm i at year y. Robust standard errors, adjusted for clustering by firm in permno. The dependent variable is log equivalent price-dividend ratio for firm i at year y. Coastalstate is an indicator equal to 1 if the firm's headquarter is located in a coastal state, and equal to 0 otherwise. Topeightstate is an indicator equal to 1 if the firm’s headquarter is located in either Georgia, Connecticut, Virginia, New York, North Carolina, South Carolina, New Jersey, or Florida which were the top 8 states that had a decrease in real estate value from sea-level. Macro Controls include log equivalent GDP, Inflation and Real interest rate all for a given year y. Firm Controls include total intangible assets, long term debt, depreciation and amortization, research and development expenditure, and capital expenditure all denominated by total assets at a given year y at quarter q for a firm i. The samples include all companies cross-listed on CRSP and Compustat from 1993 January to 2013 December. The significance level of the coefficients are denoted as follows: *5% **1% ***0.1%")

"Firm Controls = ltd intangible rev cogs capx") ///
title("PD ratio vs Sea-Level interacted with Industry dummy") ///
scalar("N_clust Clusters" "r2 R-squared") ///
note("The unit of observation is firm i at year y. Robust standard errors, adjusted for clustering by firm in permno. The dependent variable is log equivalent price-dividend ratio for firm i at year y. Coastalstate is an indicator equal to 1 if the firm's headquarter is located in a coastal state, and equal to 0 otherwise. Topeightstate is an indicator equal to 1 if the firm’s headquarter is located in either Georgia, Connecticut, Virginia, New York, North Carolina, South Carolina, New Jersey, or Florida which were the top 8 states that had a decrease in real estate value from sea-level. Macro Controls include log equivalent GDP, Inflation and Real interest rate all for a given year y. Firm Controls include total intangible assets, long term debt, depreciation and amortization, research and development expenditure, and capital expenditure all denominated by total assets at a given year y at quarter q for a firm i. The samples include all companies cross-listed on CRSP and Compustat from 1993 January to 2013 December. The significance level of the coefficients are denoted as follows: *5% **1% ***0.1%")
//

/// cross validating the entire thing (industry-level)

reg logpd ltd intangible rev cogs capx ///
loggdp realinterestrate inflation i.group#c.sealevelchange ///
if firstsample == 1, cluster(firm)

reg logpd ltd intangible rev cogs capx ///
loggdp realinterestrate inflation i.group#c.sealevelchange ///
if firstsample == 0, cluster(firm)

reg return ltd intangible rev cogs capx ///
loggdp realinterestrate inflation i.group#c.sealevelchange ///
if firstsample == 1, cluster(firm)

reg return ltd intangible rev cogs capx ///
loggdp realinterestrate inflation i.group#c.sealevelchange ///
if firstsample == 0, cluster(firm)


/// cross validating the entire thing (sector-level)
reg logpd ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.gicindustries#c.sealevelchange ///
if firstsample == 1, cluster(permno)

reg logpd ltd intangible rev cogs capx ///
loggdp Realinterestrate Inflation i.gicindustries#c.sealevelchange ///
if firstsample != 1, cluster(permno)

// cross-validation (that I didn't do)
reg logpd ltd intangibleasset rev sales cogs randd capx ///
loggdp Realinterestrate Inflation i.gicindustries ///
i.gicindustries#c.sealevelchange, cluster(permno)

// out of sample testing

reg logpd ltd intangibleasset rev sales cogs randd capx ///
loggdp Realinterestrate Inflation i.gicindustries ///
i.gicindustries#c.sealevelchange if firstsample == 1, ///
cluster(permno) 

predict pall///
gen res = (pall-logpd)^2
sum res if firstsample == 0 // to get out of sample 

// repeat the same thing without "i.gicindustries#c.sealevelchange"

reg logpd ltd intangibleasset rev sales cogs randd capx ///
loggdp Realinterestrate Inflation i.gicindustries if firstsample == 1, ///
cluster(permno) 

predict pall2
gen res2 = (pall2-logpd)^2
sum res2 if firstsample == 0
