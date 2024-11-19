//
//  Settings.swift
//  Challenge
//
//  Created by Fran Malo on 18/11/24.
//

import SwiftUI


let LocalizeUserDefaultKey = "LocalizeUserDefaultKey"
var LocalizeDefaultLanguage = "es"
struct Settings: View {
    @AppStorage(LocalizeUserDefaultKey) private var selectedLanguage: String = "es"

    var body: some View {
        VStack(spacing: 20) {
            Text("Languages".translated())
                .font(.title)
                .padding()
            
            HStack(spacing: 20) {
                Button {
                    selectedLanguage = "es"
                    LocalizeDefaultLanguage = selectedLanguage
                    changeLanguage(to: selectedLanguage)

                } label: {
                    Text("Español")
                        .padding()
                        .background(selectedLanguage == "es" ? Color.blue.opacity(0.2) : Color.clear)
                        .cornerRadius(8)
                    
                }
                
                Button {
                    selectedLanguage = "en"
                    LocalizeDefaultLanguage = selectedLanguage
                    changeLanguage(to: selectedLanguage)

                } label: {
                    Text("English")
                        .padding()
                        .background(selectedLanguage == "en" ? Color.blue.opacity(0.2) : Color.clear)
                        .cornerRadius(8)

                }
            }
        }
        .padding()

    }
    
    private func changeLanguage(to language: String) {
        UserDefaults.standard.setValue([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        // Notificar a las vistas para que se actualicen
        NotificationCenter.default.post(name: .languageChanged, object: nil)
    }

}

#Preview {
    Settings()
}

extension Notification.Name {
    static let languageChanged = Notification.Name("languageChanged")
}
