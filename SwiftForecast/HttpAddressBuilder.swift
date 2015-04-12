//
//  HttpAddressBuilder.swift
//  SwiftForecast
//
//  Created by Matt on 3/29/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import Foundation

class HttpAddressBuilder {
    let apiKey: String
    let urlBase: NSURL
    let urlScheme = "https"
    let urlHost = "api.forecast.io"
    let urlPath = "/forecast"
    
    init(apiKey: String) {
        self.apiKey = apiKey
        urlBase = NSURL(scheme: urlScheme, host: urlHost, path: urlPath)!
    }
    
    func createCurrentForecastURL(latitude: String, longitude: String) -> NSURL? {
        let urlParams = "/" + apiKey + "/" + latitude + "," + longitude
        let fullURL = NSURL(string: urlBase.absoluteString! + urlParams)
        return fullURL
    }
    
    func createPastForecastURL(latitude: String, longitude: String, time: NSDate) -> NSURL? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateString = dateFormatter.stringFromDate(time)
        let urlParams = "/" + apiKey + "/" + latitude + "," + longitude + "," + dateString
        let fullURL = NSURL(string: urlBase.absoluteString! + urlParams)
        return fullURL
    }
}
