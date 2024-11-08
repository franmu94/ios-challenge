//
//  PopertyManager.swift
//  ChallengeIdealista
//
//  Created by Fran Malo on 8/11/24.
//

import Foundation

final class PropertyManager {
    static let shared = PropertyManager()
    
    
    private let interactor: PropertyInteractorProtocol
    var allProperties: [Property] = []
    var favoriteProperties: [Property] = []
    
    

    private init(interactor: PropertyInteractor = PropertyInteractor.shared) {
        self.interactor = interactor
        Task() {
            await getProperties()
        }
    }
    
    func getProperties() async {
        do {
            let properties = try await interactor.getPropertiesList()
            await MainActor.run {
                self.allProperties = properties
            }
        } catch {
            print(error)
        }
    }
    func toggleFavorite(for propertyID: String) {
        guard let index = allProperties.firstIndex(where: { $0.id == propertyID }) else { return }
        allProperties[index].isFavorite.toggle()
        if allProperties[index].isFavorite {
            favoriteProperties.append(allProperties[index])
        } else {
            favoriteProperties.removeAll { $0.id == propertyID }
        }
    }
    func refreshFavorites() {
        favoriteProperties = allProperties.filter { $0.isFavorite }
    }
}
