//
//  PropertyMapView.swift
//  Challenge
//
//  Created by Fran Malo on 12/11/24.
//

import SwiftUI
import MapKit

struct PropertyMapView: View {
    let latitude: Double
    let longitude: Double
    let address: String
    
    
    var isDetail: Bool
    var relativeSize: Double
    @State private var region: MKCoordinateRegion
    private let annotations: [AnnotationItem]
    
    init(property: Property, isDetail: Bool = false, relativeSize: Double = 0.6) {
        self.latitude = property.latitude
        self.longitude = property.longitude
        self.address = property.address
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
        ))
        self.annotations = [AnnotationItem(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))]
        self.isDetail = isDetail
        self.relativeSize = relativeSize
    }
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) { item in
            MapAnnotation(coordinate: item.coordinate) {
                   VStack {
                       Text(address)
                           .font(.caption)
                           .foregroundColor(Color.moradoIdealista)
                           .padding(4)
                           .background(Color.verdeIdealista)
                           .cornerRadius(8)
                           .offset(y: -25)

                       Image(systemName: "mappin")
                           .resizable()
                           .scaledToFit()
                           .frame(height: 40)
                           .foregroundColor(Color.moradoIdealista)
                           .offset(y: -35)
                   }
               }
        }
        .allowsHitTesting(isDetail)
        .navigationTitle("Mapa de la Propiedad")
        .navigationBarTitleDisplayMode(.inline)
        .frame(height: UIDevice.height * relativeSize)

    }
}

struct AnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

#Preview {
    PropertyMapView(property: Property.previewProperty)
}




