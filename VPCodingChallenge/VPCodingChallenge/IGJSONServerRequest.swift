//
//  IGJSONServerRequest.swift
//  iCheckinGenieSwift
//
//  Created by Krishna Kumar on 4/12/16.
//  Copyright © 2016 Infogain. All rights reserved.
//


//==================================================================================================
// Imports
//==================================================================================================

import Foundation

class IGJSONServerRequest {

    static let  sharedInstance = IGJSONServerRequest()
    // MARK: - POST request
    func postServerRequestToService(_ serviceName:String, bodyObject:AnyObject?) -> URLRequest? {
        return createPostServerRequest(serviceName, bodyObject: bodyObject) as URLRequest?
    }
    
    
    // MARK: - GET request
    func getServerRequestToService(serviceName:String) -> URLRequest? {
        return createGetServerRequest(serviceName: serviceName) as URLRequest?
    }
    
    /**
     * Creates a POST request encoded as JSON.
     *
     * @param serviceName Name of the service to call to.
     * @param bodyObject Object to encode in the body of the request.
     * @returns MutableURLRequest
     */
    func createPostServerRequest(_ serviceName:String, bodyObject:AnyObject?) -> NSMutableURLRequest? {
        // Make sure user did not submit number of empty spaces
        var urlStringValue = kServerEndpointURL.trimmingCharacters(in: CharacterSet.whitespaces)
        urlStringValue.append(serviceName)
        let url:URL = URL.init(string: urlStringValue)!
        let urlRequest =
            NSMutableURLRequest.init(url: url, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 0)
        urlRequest.setValue("application/json", forHTTPHeaderField: kHTTPContentTypeField)
        urlRequest.httpMethod = "POST"
        return urlRequest
    }
    
    
    /**
     * Creates a GET request.
     *
     * @param serviceName Name of the service to call to.
     * @returns URLRequest
     */
     func createGetServerRequest(serviceName:String) -> URLRequest? {
        // Make sure user did not submit number of empty spaces
        var urlStringValue = kServerEndpointURL.trimmingCharacters(in: CharacterSet.whitespaces)
        urlStringValue.append(serviceName)
        let url:URL = URL.init(string: kServerEndpointURL)!
        var urlRequest =
            URLRequest.init(url: url, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 0)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
}

