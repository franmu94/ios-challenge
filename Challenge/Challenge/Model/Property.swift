//
//  Property.swift
//  Challenge
//
//  Created by Fran Malo on 8/11/24.
//

import Foundation


struct Property: Codable, Identifiable {
    let id: String
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
    
    var hasElevator: Bool {
        description.lowercased().contains("ascensor")
    }
    
    let hasAirConditioning: Bool
    let hasBoxRoom: Bool
    let hasSwimmingPool: Bool
    let hasTerrace: Bool
    let hasGarden: Bool
    
    let hasParkingSpace: Bool
    let isParkingSpaceIncludedInPrice: Bool
    
    var isFavorite: Bool = false
    var favoriteDate: Date? = nil
}
