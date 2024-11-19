//
//  PropertyCellFavorite.swift
//  Challenge
//
//  Created by Fran Malo on 13/11/24.
//

import SwiftUI

struct PropertyCellFavorite: View {
    
    
    @Binding var property: Property
    var toggleFavorite: () -> Void
    
    var body: some View {
        
        
        HStack {
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "phone")
                    Text("Llamar")
                }
            }
            .foregroundStyle(Color.moradoIdealista)
            Spacer()
            Button {
                toggleFavorite()
            } label: {
                if let favoriteDate = property.favoriteDate {
                    Text("(\(String.formattedDate(favoriteDate)))")
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .opacity(0.8)
                }
                    Image(systemName: property.favoriteDate != nil ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                
            }
            .foregroundStyle(Color.moradoIdealista)
        }
        .padding(.horizontal)
    }
}





#Preview {
    PropertyCellFavorite(property: .constant(Property.previewProperty)) {}
}
