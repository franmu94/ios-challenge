//
//  PropertyCellView2.swift
//  Challenge
//
//  Created by Fran Malo on 13/11/24.
//

import SwiftUI


struct PropertyCellView2: View {
    @Binding var property: Property
    var toggleFavorite: () -> Void

    var body: some View {
        VStack {
            // Parte constante de la celda
            PropertyCellViewConstant(property: property, toggleFavorite: toggleFavorite)

            // Parte mutable de la celda
            PropertyCellFavorite(property: $property, toggleFavorite: toggleFavorite)
        }
    }
}

#Preview {
    PropertyCellView2(property: .constant(.previewProperty)){}
}
