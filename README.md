
### Description
SwiftForecast is a simple API wrapper around [The Dark Sky Forecast API](https://developer.forecast.io/docs/v2) in Swift.

You will need to an API key provided by The Dark Sky Forecast. You can request one [here](https://developer.forecast.io/)

### Notes
Currently, this API wrapper only supports synchronous API calls. Most functionality is currently included, except the API Options used to customize the units, language, etc. used in the response.

### Example

```swift
let apiKey = "my api key"
let latitude = "37.8267"
let longitude = "-122.423"

// Get the current forecast
let forecast = DarkSkyForecast(apiKey: apiKey).getCurrentForecast(latitude, longitude: longitude)

// Get a historical forecast
let sevenDaysAgoDate = NSDate().dateByAddingTimeInterval(-7*24*60*60)
let forecast = DarkSkyForecast(apiKey: apiKey).getPastForecast(latitude, longitude: longitude, atTime: sevenDaysAgoDate)
```

Forecast calls to the API wrapper return a <code>ForecastInfo</code> object which includes data described in the [API docs](https://developer.forecast.io/docs/v2)