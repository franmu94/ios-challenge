//
//  PropertyDTO.swift
//  Challenge
//
//  Created by Fran Malo on 8/11/24.
//

import Foundation

struct PropertyDTO: Codable {
    let propertyCode: String
    let thumbnail: String
    let floor: String
    let price: Double
    let priceInfo: PriceInfo
    let propertyType: String
    let operation: String
    let size: Double
    let exterior: Bool
    let rooms: Int
    let bathrooms: Int
    let address: String
    let province: String
    let municipality: String
    let district: String
    let country: String
    let neighborhood: String
    let latitude: Double
    let longitude: Double
    let description: String
    let multimedia: Multimedia
    let features: Features
    let parkingSpace: ParkingSpace?
}

struct PriceInfo: Codable {
    let price: Price
}

struct Price: Codable {
    let amount: Double
    let currencySuffix: String
}

struct Multimedia: Codable {
    let images: [PropertyImage]
}

struct PropertyImage: Codable {
    let url: String
    let tag: String
}

struct Features: Codable {
    let hasAirConditioning: Bool?
    let hasBoxRoom: Bool?
    let hasSwimmingPool: Bool?
    let hasTerrace: Bool?
    let hasGarden: Bool?
}

struct ParkingSpace: Codable {
    let hasParkingSpace: Bool?
    let isParkingSpaceIncludedInPrice: Bool?
}


extension PropertyDTO {
    var toProperty: Property {
        Property(id: propertyCode,
                 thumbnail: thumbnail,
                 floor: floor,
                 price: price,
                 priceInfo: priceInfo,
                 propertyType: propertyType,
                 operation: operation,
                 size: size,
                 exterior: exterior,
                 rooms: rooms,
                 bathrooms: bathrooms,
                 address: address,
                 province: province,
                 municipality: municipality,
                 district: district,
                 country: country,
                 neighborhood: neighborhood,
                 latitude: latitude,
                 longitude: longitude,
                 description: description,
                 multimedia: multimedia,
                 hasAirConditioning: features.hasAirConditioning ?? false,
                 hasBoxRoom: features.hasBoxRoom ?? false,
                 hasSwimmingPool: features.hasSwimmingPool ?? false,
                 hasTerrace: features.hasTerrace ?? false,
                 hasGarden: features.hasGarden ?? false,
                 hasParkingSpace: parkingSpace?.hasParkingSpace ?? false,
                 isParkingSpaceIncludedInPrice: parkingSpace?.isParkingSpaceIncludedInPrice ?? false)
    }
}
