//
//  ForecastInfo.swift
//  SwiftForecast
//
//  Created by Matt on 3/29/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import Foundation

public class ForecastInfo {
    public let latitude: Double?
    public let longigute: Double?
    public let timezone: String?
    public let offset: Int?
    public let currently: DataPoint?
    public let minutely: DataBlock?
    public let hourly: DataBlock?
    public let daily: DataBlock?
//    let alerts: Array<String>
//    let flags: String
    
    init(jsonData: NSDictionary){
        self.latitude = jsonData["latitude"] as? Double
        self.longigute = jsonData["longitude"] as? Double
        self.timezone = jsonData["timezone"] as? String
        self.offset = jsonData["offset"] as? Int

        let currentlyJSON = jsonData["currently"] as NSDictionary
        self.currently = DataPoint(jsonDict: currentlyJSON)
        
        let minutelyJson = jsonData["minutely"] as NSDictionary
        self.minutely = DataBlock(jsonData: minutelyJson)
        
        let hourlyJson = jsonData["hourly"] as NSDictionary
        self.hourly = DataBlock(jsonData: hourlyJson)
        
        let dailyJson = jsonData["daily"] as NSDictionary
        self.daily = DataBlock(jsonData: dailyJson)
    }
    
}