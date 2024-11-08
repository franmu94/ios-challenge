//
//  PopertyManager.swift
//  Challenge
//
//  Created by Fran Malo on 8/11/24.
//

import Foundation

final class PropertyViewModel: ObservableObject {
    
    static let shared = PropertyViewModel()
    
    private let interactor: PropertyInteractorProtocol
    @Published var allProperties: [Property] = []
    @Published var favoriteProperties: [Property] = []
    
    init(interactor: PropertyInteractor = PropertyInteractor.shared) {
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
            print("Error al obtener propiedades: \(error)")
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
