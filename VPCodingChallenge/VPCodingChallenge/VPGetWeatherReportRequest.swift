//
//  VPGetWetherReportRequest.swift
//  VPCodingChallenge
//
//  Created by intelliswift on 11/4/16.
//  Copyright © 2016 Krishna. All rights reserved.
//

// This class is for get Request for Weather data based on city name.
// Ideally There will be a RemoteOperation Base class with CreateRequest method
// and All the request class should be derived the from the RemoteOpration class
// should override the createRequest method.
// Due to time limitation I've just created the Request here only.


import Foundation

class VPGetWeatherReportRequest {
    /**
     * Creates a GET request.
     *
     * @param cityName name of the city user enters.
     * @returns URLRequest.
     */
    class func createReqestToGetWeatherReportForCity(cityName:String) -> URLRequest? {
        var urlStringValue = kServerEndpointURL
        urlStringValue.append("q=\(cityName),\(kCountryCode)&APPID=\(kOpenWeatherAPIKey)")
        urlStringValue =
            urlStringValue.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
        let url:URL = (URL.init(string: urlStringValue))!
        var urlRequest =
            URLRequest.init(url: url, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 0)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
}
