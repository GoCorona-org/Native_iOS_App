//
//  LocationHistory.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/14.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let locationHistory = try? newJSONDecoder().decode(LocationHistory.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let locationHistory = try? newJSONDecoder().decode(LocationHistory.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let locationHistory = try? newJSONDecoder().decode(LocationHistory.self, from: jsonData)

import Foundation

// MARK: - LocationHistory
struct LocationHistory: Codable {
    let locations: [Location]
}

// MARK: - Location
struct Location: Codable {
    let timestampMS: String
    let latitudeE7, longitudeE7, accuracy: Int
    let velocity, heading, altitude, verticalAccuracy: Int?
    let activity: [LocationActivity]?

    enum CodingKeys: String, CodingKey {
        case timestampMS = "timestampMs"
        case latitudeE7, longitudeE7, accuracy, velocity, heading, altitude, verticalAccuracy, activity
    }
}

// MARK: - LocationActivity
struct LocationActivity: Codable {
    let timestampMS: String
    let activity: [ActivityActivity]

    enum CodingKeys: String, CodingKey {
        case timestampMS = "timestampMs"
        case activity
    }
}

// MARK: - ActivityActivity
struct ActivityActivity: Codable {
    let type: TypeEnum
    let confidence: Int
}

enum TypeEnum: String, Codable {
    case exitingVehicle = "EXITING_VEHICLE"
    case inBus = "IN_BUS"
    case inCar = "IN_CAR"
    case inFourWheelerVehicle = "IN_FOUR_WHEELER_VEHICLE"
    case inRailVehicle = "IN_RAIL_VEHICLE"
    case inRoadVehicle = "IN_ROAD_VEHICLE"
    case inTwoWheelerVehicle = "IN_TWO_WHEELER_VEHICLE"
    case inVehicle = "IN_VEHICLE"
    case onBicycle = "ON_BICYCLE"
    case onFoot = "ON_FOOT"
    case running = "RUNNING"
    case still = "STILL"
    case tilting = "TILTING"
    case unknown = "UNKNOWN"
    case walking = "WALKING"
}



// MARK: - LocationHistoryForServer
struct LocationHistoryForServer: Codable {
    let id: String
    let locationHistory: [LocationHistoryServer]

    enum CodingKeys: String, CodingKey {
        case id
        case locationHistory = "location_history"
    }
}

// MARK: - LocationHistory
struct LocationHistoryServer: Codable {
    let timeslot, lat, long, status: String
}
