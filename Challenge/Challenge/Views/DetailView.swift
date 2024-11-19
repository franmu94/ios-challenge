//
//  DetailView.swift
//  Challenge
//
//  Created by Fran Malo on 16/11/24.
//

import SwiftUI

struct DetailView: View {
    
    
    @Binding var property: Property
    let detail: PropertyDetail
    var toggleFavorite: () -> Void
    
    @State var showAllComment = false
    @State var showMap = false
    @State var date: Date? = nil
    var body: some View {
        
        ScrollView {
            HStack {
                VStack (alignment: .leading){
                    if showMap {
                        PropertyMapView(property: property, isDetail: true, relativeSize: 0.75)
                    } else {
                        Carrusel(property: property, relativeSize:  0.75)
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
                    
                    VStack(alignment: .leading) {
                        Text(String.titleconstructor(property: property))
                            .font(.headline)
                        Text("\(property.district), \(property.municipality)")
                        Text("\(property.price, specifier: "%.2f") €")
                            .bold()
                            .font(.title)
                        
                    }
                    .padding(.top, 8)
                    .padding(.horizontal)
                    Spacer()
                    HStack{
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
                            date = property.favoriteDate

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
                    .padding(.horizontal, 60)
                    
                    
                }
            }
            
            VStack(alignment: .leading) {
                
                Text("Comentario del anunciante")
                    .font(.system(size: 25, weight: .bold))
                    .font(.title)
                Text(detail.propertyComment)
                    .lineLimit(6)
                    .padding(.bottom, 4)
                Button {
                    showAllComment.toggle()
                } label: {
                    Text("Mostrar comentario completo")
                }
                
                Text("Características básicas")
                    .font(.system(size: 25, weight: .bold))
                    .font(.title)

                HStack {
                    Text("·")
                        .font(.system(size: 24, weight: .bold))
                        .offset(y: -2)
                    Text("\(detail.moreCharacteristics.constructedArea)  m²")
                }
                
                HStack {
                    Text("·")
                        .font(.system(size: 24, weight: .bold))
                        .offset(y: -2)
                    Text("\(detail.moreCharacteristics.roomNumber)  habitaciones")
                }
                
                HStack {
                    Text("·")
                        .font(.system(size: 24, weight: .bold))
                        .offset(y: -2)
                    Text("\(detail.moreCharacteristics.bathNumber)  baños")
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            date = property.favoriteDate
        }
        .sheet(isPresented: $showAllComment) {
            ScrollView {
                Text("Comentario completo")
                    .font(.system(size: 25, weight: .bold))
                    .font(.title)
                    .padding(.top)
                
                Text(detail.propertyComment)
                    .padding()
            }
        }
    }
}


#Preview {
    DetailView(property: .constant(.previewProperty), detail: PropertyDetail.detailPreview) {}
}
