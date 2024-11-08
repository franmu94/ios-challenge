import Foundation

let MainURL = URL(string:"https://idealista.github.io/ios-challenge")!
extension URL {
    static let propertiesListURL = MainURL.appending(path: "list.json")
    static let propertiesDeatilURL = MainURL.appending(path: "detail.json")
}
