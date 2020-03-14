/// merging CRSP and COMPUSTAT-quarterly
merge m:m permno fiscalyear fiscalquarter using ///
"/Volumes/KAIWEN/494 data/COMPUSTAT199301-201312quarterly.dta"
keep if _merge==3
drop _merge
