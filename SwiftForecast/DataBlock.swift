//
//  DataBlock.swift
//  SwiftForecast
//
//  Created by Matt on 3/29/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import Foundation

public class DataBlock {
    public let summary: String?
    public let icon: String?
    public var dataPoints: Array<DataPoint>
    
    init (jsonData: NSDictionary) {
        self.dataPoints = Array()
        self.summary = jsonData["summary"] as? String
        self.icon = jsonData["icon"] as? String
        
        if let dataPoints = jsonData["data"] as? Array<Dictionary<String, AnyObject>> {
            for dataPointJSON in dataPoints {
                let dataPointDictionary = dataPointJSON as Dictionary<String, AnyObject>
                let dataPoint = DataPoint(jsonDict: dataPointDictionary)
                self.dataPoints.append(dataPoint)
            }
        }
    }
}