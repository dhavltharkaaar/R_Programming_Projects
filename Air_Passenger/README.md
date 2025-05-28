### Load the AirPassengers dataset, which is included in R
data("AirPassengers")

### Display the class of the AirPassengers object
class(AirPassengers)

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/01.png">

### Display the start date of the time series
start(AirPassengers)

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/02.png">

### Display the end date of the time series
end(AirPassengers)

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/03.png">

### Display the frequency of the time series
frequency(AirPassengers)

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/04.png">

### Display a summary of the time series, including mean, median, min, max, etc.
summary(AirPassengers)

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/05.png">

### Plot the time series data
plot(AirPassengers)

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/06.png">

### Add a regression line to the plot using linear regression
abline(reg=lm(AirPassengers ~ time(AirPassengers)))

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/07.png">

### Display the cycle of the time series
cycle(AirPassengers)

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/08.png">

### Plot the mean values for each cycle of the time series
plot(aggregate(AirPassengers, FUN = mean))

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/09.png">

### Create a boxplot of the time series grouped by cycles
boxplot(AirPassengers ~ cycle(AirPassengers))

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/10.png">

### Plot the autocorrelation function (ACF) of the logarithm of the time series

acf(log(AirPassengers))

<img src ="https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/11.png">

### Plot the ACF of the first difference of the logarithm of the time series
acf(diff(log(AirPassengers)))

<img src = "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/12.png">

### Fit an ARIMA (AutoRegressive Integrated Moving Average) model to the time series
### The model has a non-seasonal difference order of 1, a moving average order of 1,
### and a seasonal difference order of 1 with a seasonal moving average order of 1.
fit <- arima(log(AirPassengers), c(0, 1, 1), seasonal = list(order = c(0, 1, 1), period = 12))

<img  src= "https://github.com/dhavltharkaaar/R_Programming_Projects/blob/main/Air_Passenger/Markdown/13.png">
