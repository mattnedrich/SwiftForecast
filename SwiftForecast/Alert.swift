//
//  Alert.swift
//  SwiftForecast
//
//  Created by Matt on 4/12/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import Foundation

public class Alert {
    public let title: String?
    public let expires: NSDate?
    public let description: String?
    public let uri: String?
    
    init(jsonData: NSDictionary) {
        self.title = jsonData["title"] as? String
        self.description = jsonData["description"] as? String
        self.uri = jsonData["uri"] as? String
        if let expiresNumber = jsonData["expires"] as? NSNumber {
            self.expires = NSDate(timeIntervalSince1970: expiresNumber.doubleValue)
        } else {
            self.expires = nil
        }
    }
}