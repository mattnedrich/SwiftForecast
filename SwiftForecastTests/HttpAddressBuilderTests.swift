//
//  HttpAddressBuilderTests.swift
//  SwiftForecast
//
//  Created by Matt on 3/29/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import XCTest

class HttpAddressBuilderTests: XCTestCase {
    
    func testCreateCurrentForecastURL() {
        let urlBuilder = HttpAddressBuilder(apiKey: "apikey")
        let url = urlBuilder.createCurrentForecastURL("lat", longitude: "lon")
        if let urlPath = url?.absoluteURL {
            XCTAssertEqual(urlPath.absoluteString!, "https://api.forecast.io/forecast/apikey/lat,lon")
        } else {
            XCTFail("unable to get a url path from the NSURL object")
        }
    }
    
}