
### Example

```swift
let apiKey = "my api key"
let latitude = "37.8267"
let longitude = "-122.423"
let forecast = SwiftForecast(apiKey: apiKey).getCurrentForecast(latitude, longitude: longitude)
```

### Current Version
Currently, historical forecasts, flags, and alerts are not supported.