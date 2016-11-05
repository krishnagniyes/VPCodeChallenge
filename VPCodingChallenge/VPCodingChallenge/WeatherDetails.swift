
//
//  WeatherDetails.swift
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

struct WeatherDetails {
    var status: Int?
    var errorMessage: String?
    var weatherArray = [Weather]()
    var system: System?
    var name: String?
    var coordinates: CLLocationCoordinate2D?
    var wind: Wind?
}
