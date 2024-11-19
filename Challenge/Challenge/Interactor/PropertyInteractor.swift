//
//  PropertyInteractor.swift
//  Challenge
//
//  Created by Fran Malo on 8/11/24.
//

import Foundation

protocol PropertyInteractorProtocol {
    func getPropertiesList() async throws -> [Property]
    func getDetail() async throws -> PropertyDetail
}

struct PropertyInteractor: NetworkInteractor, PropertyInteractorProtocol {

    var session: URLSession
    
    static let shared = PropertyInteractor()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    func getPropertiesList() async throws -> [Property] {
        return try await getJSON(request: .get(url: .propertiesListURL), type: [PropertyDTO].self).map(\.toProperty)
    }
    
    
    func getDetail() async throws -> PropertyDetail {
        return try await getJSON(request: .get(url: .propertiesDeatilURL), type: PropertyDetail.self)
    }
}
