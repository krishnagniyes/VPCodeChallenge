//
//  VPGetWetherReportResponse.swift
//  VPCodingChallenge
//
//  Created by intelliswift on 11/4/16.
//  Copyright © 2016 Krishna. All rights reserved.
//

// =================================================================================================
// Imports
// =================================================================================================

import Foundation
import CoreLocation

class VPGetWetherReportResponse {
    var status: Int?
    var error: String?
    /// Parse the Json Data into a WeatherDetails object.
    ///
    /// - parameter data: Data returned from server.
    ///
    /// - returns: weatherDetails object.
    class func parseData(data:Data) -> WeatherDetails {
            let  jsonData =
                try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject
        
        let errorMessage:String? = jsonData[kErrorMessage] as? String
        // Workaround becuase in case of success response
        // cod is coming as an Int value
        // In Case of failiure cod is String.
        // Ideally following condition should be if (statuscode != 200)
        if (errorMessage != nil) {
            // We can use Tuple Here to return error.
            // Fill Status code & error message in WeatherDetails & return
            // If error code != 200
            var weatherDetails = WeatherDetails()
            weatherDetails.status = jsonData[kStatusCode] as? Int
            weatherDetails.errorMessage = jsonData[kErrorMessage] as? String
            return weatherDetails
        }
        // Parse Json
        // Weather Array of Dictionary.(I've created a model class Weather)
        let weatherArray = jsonData[kWeather] as! [[String:AnyObject]]
        // Create New WeatherDetails object and fill the data.
        var weatherDetails = WeatherDetails()
        for dict in weatherArray {
            let weather =
                Weather(id: dict[kId] as! Double?,
                        main: dict[kMain] as! String?,
                        description: dict[kDescription] as! String?,
                        icon: dict[kIcon] as! String?)
            weatherDetails.weatherArray.append(weather)
        }
        // Extract Sys Dictinary and fill the detail in System model.
        let sysDict = jsonData[kSys] as! [String:AnyObject]
        var system = System()
        system.country = sysDict[kCountry] as! String?
        weatherDetails.system = system
        weatherDetails.name = jsonData[kName] as! String?
        weatherDetails.status = jsonData[kStatusCode] as? Int

        // Extract the coordinate and fill in CLLocationCoordinate2D.
        let coordinateDict = jsonData[kCoordinate] as! [String:AnyObject]
        let coordinate =
            CLLocationCoordinate2D.init(latitude: coordinateDict[kLatitude] as! Double, longitude: coordinateDict[kLongitude] as! Double)
        weatherDetails.coordinates = coordinate
        // Extract the wind dictionary and fill in Wind Model.
        let windDict = jsonData[kWind] as! [String:AnyObject]
        let wind = Wind(speed: windDict[kSpeed] as? Double, deg: windDict[kDeg] as? Double)
        weatherDetails.wind = wind
        // WeatherDetails object.
        return weatherDetails
    }
}
