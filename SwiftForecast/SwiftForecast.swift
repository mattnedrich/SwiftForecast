//
//  SwiftForecast.swift
//  SwiftForecast
//
//  Created by Matt on 3/29/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import Foundation

public class SwiftForecast {
    let apiKey: String
    private let jsonProvider: WeatherJSONProvider
    
    public init(apiKey: String) {
        self.apiKey = apiKey
        self.jsonProvider = WeatherJSONProvider(apiKey: apiKey)
    }
    
    public func getCurrentForecast(latitude: String, longitude: String) -> ForecastInfo {
        let jsonData = self.jsonProvider.getWeatherJSON(latitude, longitude: longitude)
        let forecast = ForecastInfo(jsonData: jsonData)
        return forecast
    }
}