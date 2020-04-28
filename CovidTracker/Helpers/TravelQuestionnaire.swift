//
//  TravelQuestionnaire.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/28.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import Foundation

// MARK: - TravelQuestionnaire
struct TravelQuestionnaire: Codable {
    var domesticFlight, domesticTrain, domesticAuto, domesticCab: Bool
    var currentState, domesticAirportFrom, domesticAirportTo: String
    var internationalMode: Bool
    var countryTravelled: String

    enum CodingKeys: String, CodingKey {
        case domesticFlight = "domestic_flight"
        case domesticTrain = "domestic_train"
        case domesticAuto = "domestic_auto"
        case domesticCab = "domestic_cab"
        case currentState = "current_state"
        case domesticAirportFrom = "domestic_airport_from"
        case domesticAirportTo = "domestic_airport_to"
        case internationalMode = "international_mode"
        case countryTravelled = "country_travelled"
    }
}

// MARK: - MedmapResult
struct MedmapResult: Codable {
    let medUUID: String
    let age, height, weight: Int
    let diabetes, kidney, heart, lungs: Bool
    let stroke, hypertension, hiv, transplant: Bool
    let fever, cough: Int
    let breathlessness, fatigue, jointPain, lossOfTasteAndSmell: Bool
    let soreThroat, nasalCongestion, headache, chills: Bool
    let nauseaOrVomiting, diarrhea, conjunctivalCongestion: Bool
    let symptomsImprovement: Int
    let domesticFlight, domesticTrain, domesticAuto, domesticCab: Bool
    let domesticAirportFrom, domesticAirportTo, currentState: String
    let internationalMode: Bool
    let countryTravelled: String

    enum CodingKeys: String, CodingKey {
        case medUUID = "med_uuid"
        case age, height, weight, diabetes, kidney, heart, lungs, stroke, hypertension, hiv, transplant, fever, cough, breathlessness, fatigue
        case jointPain = "joint_pain"
        case lossOfTasteAndSmell = "loss_of_taste_and_smell"
        case soreThroat = "sore_throat"
        case nasalCongestion = "nasal_congestion"
        case headache, chills
        case nauseaOrVomiting = "nausea_or_vomiting"
        case diarrhea
        case conjunctivalCongestion = "conjunctival_congestion"
        case symptomsImprovement = "symptoms_improvement"
        case domesticFlight = "domestic_flight"
        case domesticTrain = "domestic_train"
        case domesticAuto = "domestic_auto"
        case domesticCab = "domestic_cab"
        case domesticAirportFrom = "domestic_airport_from"
        case domesticAirportTo = "domestic_airport_to"
        case currentState = "current_state"
        case internationalMode = "international_mode"
        case countryTravelled = "country_travelled"
    }
}


var travelData = TravelQuestionnaire(domesticFlight: false, domesticTrain: false, domesticAuto: false, domesticCab: false, currentState: "", domesticAirportFrom: "", domesticAirportTo: "", internationalMode: false, countryTravelled: "")
