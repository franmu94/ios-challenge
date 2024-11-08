import Foundation

protocol PropertyInteractorProtocol {
    func getPropertiesList() async throws -> [Property]
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
}