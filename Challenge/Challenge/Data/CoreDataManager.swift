//
//  CoreDataManager.swift
//  Challenge
//
//  Created by Fran Malo on 15/11/24.
//

import CoreData
import Foundation

final class CoreDataManager {
    static let shared = CoreDataManager()

    private let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "Model") 
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Error al cargar Core Data: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error al guardar en Core Data: \(error)")
            }
        }
    }
}

extension CoreDataManager {
    func saveProperties(_ properties: [Property]) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = PropertyEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("Error al eliminar propiedades existentes: \(error)")
        }

        for property in properties {
            let entity = PropertyEntity(context: context)
            entity.id = property.id
            entity.thumbnail = property.thumbnail
            entity.floor = property.floor
            entity.price = property.priceInfo.price.amount
            entity.propertyType = property.propertyType
            entity.operation = property.operation
            entity.size = property.size
            entity.rooms = Int16(property.rooms)
            entity.bathrooms = Int16(property.bathrooms)
            entity.address = property.address
            entity.district = property.district
            entity.favoriteDate = property.favoriteDate
            entity.latitude = property.latitude
            entity.longitude = property.longitude

            entity.imageURLs = property.multimedia.images.map { $0.url }
            entity.imageTags = property.multimedia.images.map { $0.tag }

            entity.hasairconditioning = property.hasAirConditioning
            entity.hasboxroom = property.hasBoxRoom
            entity.haspool = property.hasSwimmingPool
            entity.hasterrace = property.hasTerrace
            entity.hasgarden = property.hasGarden
            entity.hasparking = property.hasParkingSpace
            entity.isparkinginprince = property.isParkingSpaceIncludedInPrice        }
        saveContext()
    }

    func fetchProperties() -> [Property] {
        let fetchRequest: NSFetchRequest<PropertyEntity> = PropertyEntity.fetchRequest()

        do {
            let results = try context.fetch(fetchRequest)
            return results.map { entity in
                Property(
                    id: entity.id ?? "",
                    thumbnail: entity.thumbnail ?? "",
                    floor: entity.floor ?? "",
                    price: entity.price,
                    priceInfo: PriceInfo(price: Price(amount: entity.price, currencySuffix: "€")),
                    propertyType: entity.propertyType ?? "",
                    operation: entity.operation ?? "",
                    size: entity.size,
                    exterior: entity.exterior,
                    rooms: Int(entity.rooms),
                    bathrooms: Int(entity.bathrooms),
                    address: entity.address ?? "",
                    province: entity.province ?? "",
                    municipality: entity.municipality ?? "",
                    district: entity.district ?? "",
                    country: entity.country ??  "",
                    neighborhood: entity.neighborhood ?? "",
                    latitude: entity.latitude,
                    longitude: entity.longitude,
                    description: entity.propertydescription ??  "",
                    multimedia: Multimedia(
                        images: (0..<min(entity.imageURLs.count, entity.imageTags.count)).map { index in
                            PropertyImage(url: entity.imageURLs[index], tag: entity.imageTags[index])
                        }
                    ),
                    hasAirConditioning: entity.hasairconditioning,
                    hasBoxRoom: entity.hasboxroom,
                    hasSwimmingPool: entity.haspool,
                    hasTerrace: entity.hasterrace,
                    hasGarden: entity.hasgarden,
                    hasParkingSpace: entity.hasparking,
                    isParkingSpaceIncludedInPrice: entity.isparkinginprince,
                    favoriteDate: entity.favoriteDate
                )
            }
        } catch {
            print("Error al cargar propiedades: \(error)")
            return []
        }
    }
}

extension PropertyEntity {
    var imageURLs: [String] {
            get {
                (urlimages as? [String]) ?? []
            }
            set {
                urlimages = newValue as NSArray
            }
        }
    
    var imageTags: [String] {
            get {
                (tagimages as? [String]) ?? []
            }
            set {
                tagimages = newValue as NSArray
            }
        }
}




