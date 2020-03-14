/// converting monthly returns to annual returns

collapse (mean) price, by(permno fiscalyear)

bysort permno (fiscalyear): gen return = (price - price[_n-1])/price[_n-1]
