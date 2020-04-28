//
//  Medmap.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/28.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import Foundation

struct Medmap: Codable {
    var medUUID: String
    var age, height, weight: Int
    var diabetes, kidney, heart, lungs: Bool
    var stroke, hypertension, hiv, transplant: Bool
    var fever, cough: Int
    var breathlessness, fatigue, jointPain, lossOfTasteAndSmell: Bool
    var soreThroat, nasalCongestion, headache, chills: Bool
    var nauseaOrVomiting, diarrhea, conjunctivalCongestion: Bool
    var symptomsImprovement: Int

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
    }
}


var medicalData: Medmap = Medmap(medUUID: "", age: 0, height: 0, weight: 0, diabetes: false, kidney: false, heart: false, lungs: false, stroke: false, hypertension: false, hiv: false, transplant: false, fever: 0, cough: 0, breathlessness: false, fatigue: false, jointPain: false, lossOfTasteAndSmell: false, soreThroat: false, nasalCongestion: false, headache: false, chills: false, nauseaOrVomiting: false, diarrhea: false, conjunctivalCongestion: false, symptomsImprovement: 0)
