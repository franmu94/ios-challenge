//
//  Carrusel.swift
//  Challenge
//
//  Created by Fran Malo on 11/11/24.
//

import SwiftUI

struct Carrusel: View {

    let property: Property
    var relativeSize = 0.6
    @State var showedImage: Int = 1
    var body: some View {
        TabView {
            
            ForEach(property.multimedia.images.map{$0.url }, id: \.self) { image in
                AsyncImage(url: URL(string: image)) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .onAppear {
                    showedImage = (property.multimedia.images.map{ $0.url }.firstIndex(of: image) ?? 0) + 1
                }
            }
            
        }

        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .overlay(alignment: .bottomTrailing) {
            Text("\(showedImage)/\(property.multimedia.images.count)")
                .foregroundStyle(Color.white)
                .padding(.vertical,6)
                .padding(.horizontal,8)

                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(Color.gray.opacity(0.9))
                }
                .padding()
            
        }
      .frame(height: UIDevice.height * relativeSize)
    }
}

#Preview {
    Carrusel(property: Property.previewProperty)
}
