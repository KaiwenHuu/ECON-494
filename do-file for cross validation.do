eststo: quietly reg outpd testpd, robust
eststo: quietly reg outreturn testreturn, robust
eststo: quietly reg outreturn testreturn if gicsgroup != 4010, robust

esttab, ar2

esttab using crossvalidation.tex, se ///
title("Cross-Validation Test") ///
scalar("r2 R-squared") ///
note("The unit of observation is firm i at year y. Robust standard errors, adjusted for clustering by firm in permno. The dependent variable is log equivalent price-dividend ratio for firm i at year y. Coastalstate is an indicator equal to 1 if the firm's headquarter is located in a coastal state, and equal to 0 otherwise. Topeightstate is an indicator equal to 1 if the firm’s headquarter is located in either Georgia, Connecticut, Virginia, New York, North Carolina, South Carolina, New Jersey, or Florida which were the top 8 states that had a decrease in real estate value from sea-level. Macro Controls include log equivalent GDP, Inflation and Real interest rate all for a given year y. Firm Controls include total intangible assets, long term debt, depreciation and amortization, research and development expenditure, and capital expenditure all denominated by total assets at a given year y at quarter q for a firm i. The samples include all companies cross-listed on CRSP and Compustat from 1993 January to 2013 December. The significance level of the coefficients are denoted as follows: *5% **1% ***0.1%")

label var outofsample "Beta Coefficients For Out of Sample Observations"

label var testsample "Beta Coefficients For Testing Observations"

twoway (scatter outreturn testreturn) (lfit outreturn testreturn) (lfit outreturn testreturn if group != 4010), title("Cross-Validation Test") subtitle("Testing-Sample (2004-2008) vs Out-of-Sample (2009-2013)")
 
twoway (scatter outpd testpd) (lfit outpd testpd), title("Cross-Validation Test") subtitle("Testing-Sample (2004-2008) vs Out-of-Sample (2009-2013)")

