#Indian Stocks

# Indian Stocks
#stocks2

# Get quantmod
if (!require("quantmod")) {
  install.packages("quantmod")
  library(quantmod)
}

start <- as.Date("2018-01-01")
end <- as.Date("2019-02-09")
getSymbols("SBIN.NS", src = "yahoo", from = start, to = end)
?getSymbols
# What is SBI?
class(SBIN.NS)
head(SBIN.NS)
tail(SBIN.NS)
#plot only closing prices
plot(SBIN.NS[, "SBIN.NS.Close"], main = "SBIN.NS")
plot(SBIN.NS[, "SBIN.NS.Close"],na.action= na.omit, main = "SBIN.NS")
plot(tail(SBIN.NS[, "SBIN.NS.Close"]), main='Last 6 days rates')
#plot candle Chart
candleChart(SBIN.NS[1:50,], up.col = "black", dn.col = "red", theme = "white")


#ICICIBANK.NS
#TATAMOTORS.NS
getSymbols(c("ICICIBANK.NS", "TATAMOTORS.NS"), src = "yahoo", from = start, to = end)

stocks = as.xts(data.frame(SBIN = SBIN.NS[, "SBIN.NS.Close"]))
stocks
stocks = as.xts(data.frame(SBIN = SBIN.NS[, "SBIN.NS.Close"], ICICI = ICICIBANK.NS[, "ICICIBANK.NS.Close"], TATAMOTORS = TATAMOTORS.NS[, "TATAMOTORS.NS.Close"]))
head(stocks)
#in zoo format you can have multiple TS
plot(as.zoo(stocks), screens = 1, lty = 1:3, col=1:3, main='Indian Stock Rates', xlab = "Date", ylab = "Price")
legend("topright", c("SBIN", "ICICI", "TATATMOTORS"), lty = 1:3, col=1:3, cex = 0.5)

#end of analysis
