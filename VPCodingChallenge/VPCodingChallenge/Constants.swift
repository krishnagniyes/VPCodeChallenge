//
//  Constants.swift
//  TheCodeChallengeJMPC
//
//  Created by intelliswift on 10/27/16.
//  Copyright © 2016 Krishna. All rights reserved.
//


import Foundation

// Endpoint URL - This needs to set as per need eg: Prod, release, Debug.
let kServerEndpointURL = "http://api.openweathermap.org/data/2.5/weather?"
// Weather Icon URL.
let kIconURL = "http://openweathermap.org/img/w/"
// Country Code as per ISO 3166 country codes.
let kCountryCode = "US"

// HTTP Header keys.
let kHTTPContentTypeField = "Content-Type"

// OpenWeatherAPI Key - Replace with your API Key.
let kOpenWeatherAPIKey = "f186c5c6da8f5f3cc0fd7348f97ff368"

// Completetion block - used in Network Requests.
typealias parseDataCompletionHandlerBlock = (Data?, NSError?) -> Void
typealias renderedoDataCompletionBlock = (AnyObject?) -> Void

// Key to save the last searched city.
let kLastSearchedCity = "LastSearchedCity"

// String contants found in the feed.
// Ideally these keys should be in respective used to parse the Json instead of hard coded strings.

// Weather - Array of Dictionaries
let kWeather = "weather"
let kMain = "main"
let kDescription = "description"
let kIcon = "icon"
let kId = "id"
let kBase = "base"
let kName = "name"

// Temprature
let kTemp = "temp"
let kPressure = "pressure"
let kHumidity = "humidity"
let kTemp_min = "temp_min"
let kTemp_max = "temp_max"
let kVisibility = "visibility"

// Sys
let kSys = "sys"
let kCountry = "country"
let kYype = "type"
let kMessage = "message"
let kSunrise = "sunrise"
let kSunset = "sunset"

// Error
let kStatusCode = "cod"
let kErrorMessage = "message"

// Coordinate
let kCoordinate = "coord"
let kLongitude = "lon"
let kLatitude = "lat"

// Wind
let kWind = "wind"
let kSpeed = "speed"
let kDeg = "deg"

// For More Details - Refer following JSON Response.
//{
//    "coord": {
//        "lon": -0.13,
//        "lat": 51.51
//    },
//    "weather": [{
//    "id": 741,
//    "main": "Fog",
//    "description": "fog",
//    "icon": "50n"
//    }, {
//    "id": 300,
//    "main": "Drizzle",
//    "description": "light intensity drizzle",
//    "icon": "09n"
//    }],
//    "base": "stations",
//    "main": {
//        "temp": 277.76,
//        "pressure": 1005,
//        "humidity": 87,
//        "temp_min": 275.15,
//        "temp_max": 281.15
//    },
//    "visibility": 9000,
//    "wind": {
//        "speed": 2.1,
//        "deg": 300
//    },
//    "clouds": {
//        "all": 36
//    },
//    "dt": 1478296200,
//    "sys": {
//        "type": 1,
//        "id": 5091,
//        "message": 0.0255,
//        "country": "GB",
//        "sunrise": 1478242894,
//        "sunset": 1478276755
//    },
//    "id": 2643743,
//    "name": "London",
//    "cod": 200
//}
//
