//
//  WeatherJSONProvider.swift
//  SwiftForecast
//
//  Created by Matt on 3/29/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import Foundation

class WeatherJSONProvider {
    let urlBuilder: HttpAddressBuilder
    
    init (apiKey: String) {
        urlBuilder = HttpAddressBuilder(apiKey: apiKey)
    }
    
    func getWeatherJSON(latitude: String, longitude: String) -> NSDictionary {
        let url = urlBuilder.createCurrentForecastURL(latitude, longitude: longitude)
        return getJSONSync(url!)
    }
    
    func getJSONSync(url: NSURL) -> NSDictionary {
        let responseData = getURLResponseSync(url)
        var error: NSError?
        let jsonDictionary = NSJSONSerialization.JSONObjectWithData(responseData, options: nil, error: &error) as NSDictionary
        return jsonDictionary
    }
    
    func getURLResponseSync(url: NSURL) -> NSData {
        let sem = dispatch_semaphore_create(0)
        var responseData = NSData()
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            responseData = data
            dispatch_semaphore_signal(sem)
        }).resume()
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER)
        return responseData
    }
}