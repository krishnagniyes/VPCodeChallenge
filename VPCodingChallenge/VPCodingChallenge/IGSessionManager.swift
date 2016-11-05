//
//  IGSessionManager.swift
//  iCheckinGenieSwift
//
//  Created by Krishna Kumar on 4/12/16.
//  Copyright © 2016 Infogain. All rights reserved.
//

// =================================================================================================
// Imports
// =================================================================================================

import NetworkExtension

class IGSessionManager {
    static func sessionWithDefaultConfiguration() -> URLSession {
        return URLSession.init(configuration: URLSessionConfiguration.default)
    }

    static func sessionWithEphemeralConfiguration() -> URLSession {
        return URLSession.init(configuration: URLSessionConfiguration.ephemeral)
    }
    
    static func sessionWithBackgroundConfiguration() -> URLSession {
        return URLSession.init(configuration:  URLSessionConfiguration.background(withIdentifier: "Background"))
    }
}
