//
//  Clown.swift
//  ClownFinder
//
//  Created by Manuel Savà on 25/03/23.
//

import Foundation
import MapKit

struct Clown: Codable, Identifiable {
    let id: Int
    let name: String
    let shortDescription: String
    let extendedDescription: String
    let latitude: Double
    let longitude: Double
    let imageName: String
    let instagram: String
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct MockClown: Identifiable {
    let id = 1
    static let manuClown =         Clown.init(            id: 1,
                                                          name: "Manu",
                                                          shortDescription: "L'inventore di sta clownata",
                                                          extendedDescription: "Non ha letteralmente un cazzo da fare e quindi si inventa ste stronzate. Gymcoach dei Gymbro Ricky e Fede, gran mangiatore di panini bislunghi nei giorni di sgarro. Finito sto meme andrà a suicidarsi o si inventerà di peggio",
                                                          latitude: 45.60678,
                                                          longitude: 9.23146,
                                                          imageName: "manu",
                                                          instagram: "https://instagram.com/21savam?igshid=YmMyMTA2M2Y="
    )
}

struct localClowns {
    let clowns = [
        Clown.init(            id: 1,
                               name: "Manu",
                               shortDescription: "L'inventore di sta clownata",
                               extendedDescription: "Non ha letteralmente un cazzo da fare e quindi si inventa ste stronzate. Gymcoach dei Gymbro Ricky e Fede, gran mangiatore di panini bislunghi nei giorni di sgarro. Finito sto meme andrà a suicidarsi o si inventerà di peggio",
                               latitude: 45.60678,
                               longitude: 9.23146,
                               imageName: "manu",
                               instagram: "https://instagram.com/21savam?igshid=YmMyMTA2M2Y="
                  ),
        Clown.init(            id: 2,
                               name: "Lillo",
                               shortDescription: "Portami a Monza ti do tutto quello che vuoi",
                               extendedDescription: "Gli piacerebbe andare a Monza ma come si denota dalla mappa è bloccato tra Desio e Lissone. Fondatore di una startup che non è ancora stata fondata. Fossi in te lo seguirei ",
                               latitude: 45.62024,
                               longitude: 9.23211,
                               imageName: "lillo",
                               instagram: "https://instagram.com/annapep3?igshid=YmMyMTA2M2Y="
                  ),
        Clown.init(            id: 3,
                               name: "Andre",
                               shortDescription: "Andiamo al biliardo?",
                               extendedDescription: "Litiga con fede per le sue preferenze di Formula1, MotoGP e calcio. Viene fermato nei locali perchè va alla IULM ed è costretto a fare foto ed autografi. Se non va almeno una volta a settimana a sbiliardare sfasa.",
                               latitude: 45.60662,
                               longitude: 9.23262,
                               imageName: "andre",
                               instagram: "https://instagram.com/andreacardascia?igshid=YmMyMTA2M2Y="
                  ),
        Clown.init(            id: 4,
                               name: "Ricky",
                               shortDescription: "Mi hanno fermato gli sbirri",
                               extendedDescription: "Non ha un ginocchio ma è comunque capace di correre e fare la leg extension. Va a Vedano per assistere alla retrocessione della sua squadra nel campinato del CIM. Leggenda degli animatori",
                               latitude: 45.60624,
                               longitude: 9.22908,
                               imageName: "ricky",
                               instagram: "https://instagram.com/riccardo.comi?igshid=YmMyMTA2M2Y="
                  ),
        Clown.init(            id: 5,
                               name: "Fede",
                               shortDescription: "Sto squattando",
                               extendedDescription: "Sinceramente bisognerebbe scrivere 3 libri per fare la descrizione di Fede. Non so veramente da dove cominciare... è il Dio punto e basta.",
                               latitude: 45.60561,
                               longitude: 9.23358,
                               imageName: "fede",
                               instagram: "https://instagram.com/trezzichandon96?igshid=YmMyMTA2M2Y="
                  ),
        Clown.init(            id: 6,
                               name: "Simo",
                               shortDescription: "Non fumo più",
                               extendedDescription: "Ha promesso per la 35esima volta che smette di fumare, il che è decisamente triste per il suo personaggio. È il GOAT in ogni cosa che decide di fare",
                               latitude: 45.60346,
                               longitude: 9.23212,
                               imageName: "simo",
                               instagram: "https://instagram.com/enne.simo?igshid=YmMyMTA2M2Y="
                  ),
    ]
}
