//
//  Detail.swift
//  Challenge
//
//  Created by Fran Malo on 16/11/24.
//

import Foundation

struct PropertyDetail: Codable {
    let adid: Int
    let price: Double
    let pricingDetails: PricingDetails
    let operation: String
    let propertyType: String
    let extendedPropertyType: String
    let homeType: String
    let state: String
    let multimedia: MultimediaDetail
    let propertyComment: String
    let ubication: Ubication
    let country: String
    let moreCharacteristics: MoreCharacteristics
    let energyCertification: EnergyCertification

    enum CodingKeys: String, CodingKey {
        case adid
        case price
        case pricingDetails = "priceInfo"
        case operation
        case propertyType
        case extendedPropertyType
        case homeType
        case state
        case multimedia
        case propertyComment
        case ubication
        case country
        case moreCharacteristics
        case energyCertification
    }
}

struct PricingDetails: Codable {
    let amount: Double
    let currencySuffix: String
}

struct MultimediaDetail: Codable {
    let images: [PropertyImageDetail]
}

struct PropertyImageDetail: Codable {
    let url: String
    let tag: String
    let localizedName: String
    let multimediaId: Int
}

struct Ubication: Codable {
    let latitude: Double
    let longitude: Double
}

struct MoreCharacteristics: Codable {
    let communityCosts: Double
    let roomNumber: Int
    let bathNumber: Int
    let exterior: Bool
    let housingFurnitures: String
    let agencyIsABank: Bool
    let energyCertificationType: String
    let flatLocation: String
    let modificationDate: TimeInterval
    let constructedArea: Int
    let lift: Bool
    let boxroom: Bool
    let isDuplex: Bool
    let floor: String
    let status: String
}

struct EnergyCertification: Codable {
    let title: String
    let energyConsumption: EnergyConsumption
    let emissions: EnergyConsumption


}

struct EnergyConsumption: Codable {
    let type: String
}
