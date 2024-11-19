//
//  PreviewData.swift
//  Challenge
//
//  Created by Fran Malo on 11/11/24.
//

import Foundation

struct PropertyInteractorPreview: PropertyInteractorProtocol {
    func getDetail() async throws -> PropertyDetail {
        let url = Bundle.main.url(forResource: "PreviewDetail", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(PropertyDetail.self, from: data)
    }
    
    func getPropertiesList() async throws -> [Property] {
        let url = Bundle.main.url(forResource: "PreviewList", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode([PropertyDTO].self, from: data).map(\.toProperty)
    }
}

extension Property {
    static let previewProperty = Property(
        id: "1",
        thumbnail: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp",
        floor: "2",
        price: 1195000.0,
        priceInfo: PriceInfo(
            price: Price(
                amount: 1195000.0,
                currencySuffix: "€"
            )
        ),
        propertyType: "flat",
        operation: "sale",
        size: 133.0,
        exterior: false,
        rooms: 3,
        bathrooms: 2,
        address: "calle de Lagascssa",
        province: "Madrid",
        municipality: "Madrid",
        district: "Barrio de Salamanca",
        country: "es",
        neighborhood: "Castellana",
        latitude: 40.4362687,
        longitude: -3.6833686,
        description: """
              Venta.Piso EN EXCLUSIVA. Castellana. Se ofrece en venta vivienda de 133 m² en el exclusivo Barrio de Salamanca, zona Castellana, con 3 dormitorios (uno en suite), 2 baños, amplio salón comedor, cocina independiente con office y lavadero. Cuenta con un amplio patio privado y armarios empotrados en todas las habitaciones. Reformado para optimizar el espacio, ofrece gran potencial para personalizarlo. Ubicado en una de las zonas más exclusivas de Madrid, el Barrio de Salamanca, en la cotizada zona de Castellana, se encuentra este espacioso piso en venta de 133 m² que ofrece una oportunidad única para quienes buscan una vivienda que combine comodidad, ubicación y potencial de actualización.\n\nEl inmueble cuenta con un salón -comedor, amplio y luminoso, es perfecto para disfrutar de momentos de convivencia con la familia o amigos, y está conectado a un patio de uso privativo, una verdadera joya en pleno centro de la ciudad. Este espacio exterior es ideal para relajarse, organizar comidas al aire libre o incluso para ser transformado en una zona verde que aporte tranquilidad y frescura al hogar. La cocina es independiente y dispone de una cómoda zona de office, perfecta para las comidas cotidianas, además de contar con un práctico lavadero adjunto que facilita las tareas del hogar.\n\nAdemás, dispone de tres amplios dormitorios, destacando el dormitorio principal, que es una suite completa con un baño privado, ofreciendo privacidad y confort. Los otros dos dormitorios también disponen de armarios empotrados, maximizando el almacenamiento en cada habitación.El piso incluye dos cuartos de baño completos, con un diseño moderno y funcional, ideales para el día a día de una familia o para invitados.\n\nCabe destacar que este piso ha sido previamente reformado con una distribución que aprovecha al máximo el espacio disponible, brindando una excelente base para que puedas personalizarlo según tus gustos y necesidades. \nMUCHAS DE NUESTRAS PROPIEDADES NO APARECEN EN IDEALISTA, CONSULTA NUESTRA PÁGINA WEB PARA VER MÁS PROPIEDADES EXCLUSIVAS.\n\nSin duda, el distrito selecto por excelencia de Madrid. Pasear por las calles del barrio de Salamanca es contemplar los edificios más elegantes y codiciados de la capital: construcciones históricas de portales señoriales e interiores amplios y altos. Concebido en las últimas décadas del siglo XIX por D. José de Salamanca y Mayol, Marqués de Salamanca, este ensanche de la ciudad conserva intacto su aire aristocrático, que podemos ver en palacetes como el de la Embajada de Italia, por ejemplo.\nEn este epicentro del lujo se localiza la conocida “Milla de Oro”: un área comercial donde tienen su sede marcas prestigiosas como Dior, Chanel, Prada o Tiffany y Promora. Tiendas como Gallery, BD o Vitra y restaurantes como Ramsés o No, responden a los gustos de un life style moderno y sofisticado. Hablamos de una zona dinámica y segura, de grandes aceras, con un parking casi ilimitado y con una interesante vida nocturna: Nxt Club, Déjate Besar o Le Boutique Club.\nNo faltan las galerías de arte y los espacios dedicados a la cultura como la Fundación March o el museo Lázaro Galdiano. Sin olvidar sus árboles frondosos y la cercanía al parque del Retiro, el gran pulmón verde del centro de Madrid.
            """,
        multimedia: Multimedia(
            images: [
                PropertyImage(
                    url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp",
                    tag: "livingRoom"
                ),
                PropertyImage(
                    url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/a1/0f/ee/1273036728.webp",
                    tag: "unknown"
                ),
                PropertyImage(
                    url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/79/6b/e0/1273036729.webp",
                    tag: "views"
                ),
                PropertyImage(
                    url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/00/c5/91/1273036730.webp",
                    tag: "facade"
                ),
                PropertyImage(
                    url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/c8/fe/3e/1273036731.webp",
                    tag: "livingRoom"
                )
            ]
        ),
        hasAirConditioning: true,
        hasBoxRoom: false,
        hasSwimmingPool: false,
        hasTerrace: false,
        hasGarden: false,
        hasParkingSpace: true,
        isParkingSpaceIncludedInPrice: true,
        favoriteDate: Date()
    )
}



extension PropertyDetail {
    static let detailPreview = PropertyDetail(
        adid: 1,
        price: 1195000.0,
        pricingDetails: PricingDetails(
            amount: 1195000.0,
            currencySuffix: "€"
        ),
        operation: "sale",
        propertyType: "homes",
        extendedPropertyType: "flat",
        homeType: "flat",
        state: "active",
        multimedia: MultimediaDetail(
            images: [
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/58/60/32/1273036727.webp",
                    tag: "livingRoom",
                    localizedName: "Salón",
                    multimediaId: 1273036727
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/a1/0f/ee/1273036728.webp",
                    tag: "unknown",
                    localizedName: "Desconocido",
                    multimediaId: 1273036728
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/79/6b/e0/1273036729.webp",
                    tag: "views",
                    localizedName: "Vistas",
                    multimediaId: 1273036729
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/00/c5/91/1273036730.webp",
                    tag: "facade",
                    localizedName: "Fachada",
                    multimediaId: 1273036730
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/c8/fe/3e/1273036731.webp",
                    tag: "livingRoom",
                    localizedName: "Salón",
                    multimediaId: 1273036731
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/f6/5e/9b/1273036732.webp",
                    tag: "livingRoom",
                    localizedName: "Salón",
                    multimediaId: 1273036732
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/86/b1/b0/1273036733.webp",
                    tag: "livingRoom",
                    localizedName: "Salón",
                    multimediaId: 1273036733
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/7d/e1/66/1273036734.webp",
                    tag: "livingRoom",
                    localizedName: "Salón",
                    multimediaId: 1273036734
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/20/f2/79/1273036794.webp",
                    tag: "communalareas",
                    localizedName: "Zonas comunes",
                    multimediaId: 1273036794
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/a5/dc/82/1273036797.webp",
                    tag: "communalareas",
                    localizedName: "Zonas comunes",
                    multimediaId: 1273036797
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/f3/d4/df/1273036798.webp",
                    tag: "communalareas",
                    localizedName: "Zonas comunes",
                    multimediaId: 1273036798
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/6b/39/a4/1273036799.webp",
                    tag: "communalareas",
                    localizedName: "Zonas comunes",
                    multimediaId: 1273036799
                ),
                PropertyImageDetail(
                    url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/81/72/2d/1273036800.webp",
                    tag: "communalareas",
                    localizedName: "Zonas comunes",
                    multimediaId: 1273036800
                )
            ]
        ),
        propertyComment: "Venta.Piso EN EXCLUSIVA. Castellana. Se ofrece en venta vivienda de 133 m² en el exclusivo Barrio de Salamanca, zona Castellana, con 3 dormitorios (uno en suite), 2 baños, amplio salón comedor, cocina independiente con office y lavadero. Cuenta con un amplio patio privado y armarios empotrados en todas las habitaciones. Reformado para optimizar el espacio, ofrece gran potencial para personalizarlo. Ubicado en una de las zonas más exclusivas de Madrid, el Barrio de Salamanca, en la cotizada zona de Castellana, se encuentra este espacioso piso en venta de 133 m² que ofrece una oportunidad única para quienes buscan una vivienda que combine comodidad, ubicación y potencial de actualización.\n\nEl inmueble cuenta con un salón -comedor, amplio y luminoso, es perfecto para disfrutar de momentos de convivencia con la familia o amigos, y está conectado a un patio de uso privativo, una verdadera joya en pleno centro de la ciudad. Este espacio exterior es ideal para relajarse, organizar comidas al aire libre o incluso para ser transformado en una zona verde que aporte tranquilidad y frescura al hogar. La cocina es independiente y dispone de una cómoda zona de office, perfecta para las comidas cotidianas, además de contar con un práctico lavadero adjunto que facilita las tareas del hogar.\n\nAdemás, dispone de tres amplios dormitorios, destacando el dormitorio principal, que es una suite completa con un baño privado, ofreciendo privacidad y confort. Los otros dos dormitorios también disponen de armarios empotrados, maximizando el almacenamiento en cada habitación.El piso incluye dos cuartos de baño completos, con un diseño moderno y funcional, ideales para el día a día de una familia o para invitados.\n\nCabe destacar que este piso ha sido previamente reformado con una distribución que aprovecha al máximo el espacio disponible, brindando una excelente base para que puedas personalizarlo según tus gustos y necesidades. \nMUCHAS DE NUESTRAS PROPIEDADES NO APARECEN EN IDEALISTA, CONSULTA NUESTRA PÁGINA WEB PARA VER MÁS PROPIEDADES EXCLUSIVAS.\n\nSin duda, el distrito selecto por excelencia de Madrid. Pasear por las calles del barrio de Salamanca es contemplar los edificios más elegantes y codiciados de la capital: construcciones históricas de portales señoriales e interiores amplios y altos. Concebido en las últimas décadas del siglo XIX por D. José de Salamanca y Mayol, Marqués de Salamanca, este ensanche de la ciudad conserva intacto su aire aristocrático, que podemos ver en palacetes como el de la Embajada de Italia, por ejemplo.\nEn este epicentro del lujo se localiza la conocida “Milla de Oro”: un área comercial donde tienen su sede marcas prestigiosas como Dior, Chanel, Prada o Tiffany y Promora. Tiendas como Gallery, BD o Vitra y restaurantes como Ramsés o No, responden a los gustos de un life style moderno y sofisticado. Hablamos de una zona dinámica y segura, de grandes aceras, con un parking casi ilimitado y con una interesante vida nocturna: Nxt Club, Déjate Besar o Le Boutique Club.\nNo faltan las galerías de arte y los espacios dedicados a la cultura como la Fundación March o el museo Lázaro Galdiano. Sin olvidar sus árboles frondosos y la cercanía al parque del Retiro, el gran pulmón verde del centro de Madrid.",
        ubication: Ubication(
            latitude: 40.4362687,
            longitude: -3.6833686
        ),
        country: "es",
        moreCharacteristics: MoreCharacteristics(
            communityCosts: 330.0,
            roomNumber: 3,
            bathNumber: 2,
            exterior: false,
            housingFurnitures: "unknown",
            agencyIsABank: false,
            energyCertificationType: "e",
            flatLocation: "internal",
            modificationDate: 1727683968000,
            constructedArea: 133,
            lift: true,
            boxroom: false,
            isDuplex: false,
            floor: "2",
            status: "renew"
        ),
        energyCertification: EnergyCertification(
            title: "Certificado energético",
            energyConsumption: EnergyConsumption(type: "e"),
            emissions: EnergyConsumption(type: "e")
        )
    )
}
