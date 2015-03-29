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
    public let data: Array<DataPoint>
    
    init (jsonData: NSDictionary) {
        self.data = Array()
        self.summary = jsonData["summary"] as? String
        self.icon = jsonData["icon"] as? String
        
        if let dataPoints = jsonData["data"] as? Array<NSDictionary> {
            for dataPoint in dataPoints {
                let foo = dataPoint as NSDictionary
                let block = DataPoint(jsonDict: foo)
                self.data.append(block)
            }
        }
    }
}