//
//  Flags.swift
//  SwiftForecast
//
//  Created by Matt on 4/12/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import Foundation

public class ForecastFlags {
    public let darksky_unavailable: Boolean?
    public var darksky_stations: Array<String>
    public var datapoint_stations: Array<String>
    public var isd_stations: Array<String>
    public var lamp_stations: Array<String>
    public var metar_stations: Array<String>
    public var metno_stations: Array<String>
    public var sources: Array<String>
    // TODO: Add units defined here https://developer.forecast.io/docs/v2#forecast_call
    
    init (jsonData: NSDictionary) {
        self.darksky_unavailable = jsonData["darksky-unavailable"] as? Boolean
        
        self.darksky_stations = Array()
        if let stationArray = jsonData["darksky-stations"] as? Array<String> {
            self.darksky_stations = stationArray
        }
        
        self.datapoint_stations = Array()
        if let dataPointArray = jsonData["datapoint-stations"] as? Array<String> {
            self.datapoint_stations = dataPointArray
        }
        
        self.isd_stations = Array()
        if let isdArray = jsonData["isd-stations"] as? Array<String> {
            self.isd_stations = isdArray
        }
        
        self.lamp_stations = Array()
        if let lampArray = jsonData["lamp-stations"] as? Array<String> {
            self.lamp_stations = lampArray
        }
        
        self.metar_stations = Array()
        if let metarArray = jsonData["metar-stations"] as? Array<String> {
            self.metar_stations = metarArray
        }
        
        self.metno_stations = Array()
        if let metnoArray = jsonData["metno-stations"] as? Array<String> {
            self.metno_stations = metnoArray
        }
        
        self.sources = Array()
        if let sourcesArray = jsonData["sources"] as? Array<String> {
            self.sources = sourcesArray
        }
    }
}