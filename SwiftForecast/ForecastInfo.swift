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
    public let flags: ForecastFlags?
    public var alerts: Array<Alert>
    
    init(jsonData: NSDictionary){
        self.latitude = jsonData["latitude"] as? Double
        self.longigute = jsonData["longitude"] as? Double
        self.timezone = jsonData["timezone"] as? String
        self.offset = jsonData["offset"] as? Int

        if let currentlyJSON = jsonData["currently"] as? NSDictionary {
            self.currently = DataPoint(jsonDict: currentlyJSON)
        } else {
            self.currently = nil
        }
        
        if let minutelyJson = jsonData["minutely"] as? NSDictionary{
            self.minutely = DataBlock(jsonData: minutelyJson)
        } else {
            self.minutely = nil
        }
        
        if let hourlyJson = jsonData["hourly"] as? NSDictionary {
            self.hourly = DataBlock(jsonData: hourlyJson)
        } else {
            self.hourly = nil
        }

        if let dailyJson = jsonData["daily"] as? NSDictionary {
            self.daily = DataBlock(jsonData: dailyJson)
        } else {
            self.daily = nil
        }

        if let flagJson = jsonData["flags"] as? NSDictionary {
            self.flags = ForecastFlags(jsonData: flagJson)
        } else {
            self.flags = nil
        }

        self.alerts = Array()
        if let alertsJson = jsonData["alerts"] as? Array<NSDictionary> {
            for alertJson in alertsJson  {
                self.alerts.append(Alert(jsonData: alertJson))
            }
        }
    }
    
}