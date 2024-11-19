//
//  PropertyViewModel.swift
//  Challenge
//
//  Created by Fran Malo on 8/11/24.
//

import Foundation

final class PropertyViewModel{
    
    static let shared = PropertyViewModel()
    
    private let interactor: PropertyInteractorProtocol
    private let coreDataManager = CoreDataManager.shared
    var allProperties: [Property] = []
    var favoriteProperties: [Property] = []
    var propertyDetail: PropertyDetail?
    
    init(interactor: PropertyInteractor = PropertyInteractor.shared) {
        self.interactor = interactor
        loadProperties()
        Task {
            await getDetail()
        }
    }
    
    func getDetail() async {
        do {
            let detail = try await interactor.getDetail()
            await MainActor.run {
                self.propertyDetail = detail
            }
        } catch {
            print("Error al obtener el detalle: \(error)")
        }
    }
    
    func loadProperties() {
        favoriteProperties = coreDataManager.fetchProperties()
        Task {
            await fetchFromAPI()
            await MainActor.run {
                refreshAllProperties()
            }
        }
    }
    
    func fetchFromAPI() async {
        do {
            let properties = try await interactor.getPropertiesList()
            await MainActor.run {
                self.allProperties = properties
            }
        } catch {
            print("Error al obtener propiedades: \(error)")
        }
    }
    
    func saveProperties() {
        coreDataManager.saveProperties(favoriteProperties)
    }
    
    func toggleFavorite(for propertyID: String) {
        guard let index = allProperties.firstIndex(where: { $0.id == propertyID }) else { return }
        
        if let _ = allProperties[index].favoriteDate {
            allProperties[index].favoriteDate = nil
        } else {
            allProperties[index].favoriteDate = Date()
        }
        
        
        guard let index = favoriteProperties.firstIndex(where: { $0.id == propertyID }) else { return }
        
        if let _ = favoriteProperties[index].favoriteDate {
            favoriteProperties[index].favoriteDate = nil
        } else {
            favoriteProperties[index].favoriteDate = Date()
        }
        saveProperties()
    }
    
    func refreshFavorites() {
        favoriteProperties = allProperties.filter { $0.favoriteDate != nil }
    }
    
    func refreshAllProperties() {
        allProperties = allProperties.map { property in
            if let favorite = favoriteProperties.first(where: { $0.id == property.id }) {
                return favorite
            } else {
                var updatedProperty = property
                updatedProperty.favoriteDate = nil
                return updatedProperty
            }
        }
    }
}
