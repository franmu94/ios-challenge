//
//  Extensions.swift
//  Challenge
//
//  Created by Fran Malo on 8/11/24.
//

import UIKit
import SwiftUI

extension UIColor  {
    static let verdeIdealista = UIColor(red: 225/255.0, green: 244/255.0, blue: 109/255.0, alpha: 1.0)
    static let moradoIdealista = UIColor(red: 181/255.0, green: 38/255.0, blue: 130/255.0, alpha: 1.0)
}

extension Color {
    static let verdeIdealista = Color(red: 225/255.0, green: 244/255.0, blue: 109/255.0)
    static let moradoIdealista = Color(red: 181/255.0, green: 38/255.0, blue: 130/255.0)
}


extension UIDevice {
    static var width: CGFloat {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first { $0.isKeyWindow }?
            .screen
            .bounds
            .width ?? 0
    }
    
    static var height: CGFloat {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first { $0.isKeyWindow }?
            .screen
            .bounds
            .width ?? 0
    }
    
    static var bottomInsetSize: CGFloat {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first { $0.isKeyWindow }?
            .safeAreaInsets
            .bottom ?? 0
    }
}


extension String {
    static func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
}

extension String {
    static func titleconstructor(property: Property) -> String {
        switch LocalizeDefaultLanguage {
        case "es":
            let type = switch property.propertyType {
            case "flat":
                "Piso en "
            default:
                ""
            }
            let operation = switch property.operation {
            case "sale":
                "venta en "
            case "rent":
                "alquiler en "
            default:
                ""
            }
            return "\(type)\(operation)\(property.address)"
        case "en":
            let type = switch property.propertyType {
            case "flat":
                "Flat on "
            default:
                ""
            }
            let operation = switch property.operation {
            case "sale":
                "sale on "
            case "rent":
                "rent in "
            default:
                ""
            }
            return "\(type)\(operation)\(property.address)"
            
            
        default:
            return ""
        }
    }
}


extension String {

    func translated() -> String {
        if let path = Bundle.main.path(forResource: LocalizeDefaultLanguage, ofType: "lproj"), let bundle = Bundle(path: path) {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        
        return ""
    }
}


func setupDefaultLanguage() {
    if UserDefaults.standard.string(forKey: LocalizeUserDefaultKey) == nil {
        UserDefaults.standard.setValue("es", forKey: LocalizeUserDefaultKey)
        UserDefaults.standard.setValue(["es"], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}
