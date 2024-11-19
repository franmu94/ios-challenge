//
//  PropertyCellViewConstant.swift
//  Challenge
//
//  Created by Fran Malo on 13/11/24.
//

import SwiftUI

struct PropertyCellViewConstant: View {
    
    
    var property: Property
    var toggleFavorite: () -> Void
    @State var showMap = false
    
    var body: some View {
        
        VStack (alignment: .leading){
            if showMap {
                PropertyMapView(property: property)
            } else {
                Carrusel(property: property)
            }
            HStack {
                Button {
                    showMap = false
                } label: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background() {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(lineWidth: 0.7)
                            
                        }
                }
                .buttonStyle(PlainButtonStyle())
                
                Button {
                    showMap = true
                } label: {
                    Image(systemName: "map")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background() {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(lineWidth: 0.7)
                        }
                }
                .buttonStyle(PlainButtonStyle())
                
            }
            .padding(.horizontal)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(titleconstructor())
                        .font(.headline)
                    Text("\(property.district), \(property.municipality)")
                    Text("\(property.priceInfo.price.amount, specifier: "%.2f") \(property.priceInfo.price.currencySuffix)")
                        .bold()
                        .font(.title)
                    HStack {
                        Text("\(property.rooms) hab.")
                        
                        Text("\(property.size, specifier: "%.0f")m²")
                        
                        Text("Planta \(property.floor)º \(property.exterior ? "exterior" : "interior") \(property.hasElevator ? "con" : "sin") ascensor")
                        
                    }
                    .font(.system(size: 15, weight: .light))             }
            }
            .padding(.top, 8)
            .padding(.horizontal)
        }
    }
    
    func titleconstructor() -> String {
        
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
    }
}


#Preview {
    PropertyCellViewConstant(property: (Property.previewProperty)) {}
}
