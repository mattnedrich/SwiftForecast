//
//  HttpAddressBuilderTests.swift
//  SwiftForecast
//
//  Created by Matt on 3/29/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import XCTest

class HttpAddressBuilderTests: XCTestCase {
    
    func test_CreateCurrentForecastURL() {
        let urlBuilder = HttpAddressBuilder(apiKey: "apikey")
        let url = urlBuilder.createCurrentForecastURL("lat", longitude: "lon")
        if let urlPath = url?.absoluteURL {
            XCTAssertEqual(urlPath.absoluteString!, "https://api.forecast.io/forecast/apikey/lat,lon")
        } else {
            XCTFail("unable to get a url path from the NSURL object")
        }
    }
    
    func test_CreatePastForecastURL() {
        let urlBuilder = HttpAddressBuilder(apiKey: "apikey")
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss zzz"
        let pastDate = dateFormatter.dateFromString("2014-04-23 03:23:02 EDT")
        let url = urlBuilder.createPastForecastURL("lat", longitude: "lon", time: pastDate!)
        if let urlPath = url?.absoluteURL {
            let actualString = urlPath.absoluteString!
            XCTAssertEqual(actualString, "https://api.forecast.io/forecast/apikey/lat,lon,2014-04-23T03:23:02-0400")
        } else {
            XCTFail("unable to get a url path from the NSURL object")
        }
    }
    
}