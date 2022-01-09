//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Nick Sarno on 11/26/21.
//

import Foundation
import MapKit

class ChurchLocationsDataService {
    
    static let locations: [ChurchesLocations] = [
        ChurchesLocations(
            name: "Etchmiadzin Cathedral",
            cityName: "Etchmiadzin, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 40.161929370372455, longitude: 44.29111529751223),
            description: "Etchmiadzin Cathedral (Armenian: Էջմիածնի մայր տաճար) is the mother church of the Armenian Apostolic Church, located in the city of Vagharshapat (Etchmiadzin), Armenia. According to most scholars it was the first cathedral built in ancient Armenia, and is often considered the oldest cathedral in the world.",
            imageNames: [
                "echmiadzin_1",
                "echmiadzin_2",
                "echmiadzin_3",
            ],
            link: "https://en.wikipedia.org/wiki/Etchmiadzin_Cathedral"),
        ChurchesLocations(
            name: "Saint Hripsime Church",
            cityName: "Etchmiadzin, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 40.167129457345716, longitude: 44.30954189935783),
            description: "Saint Hripsime Church (Armenian: Սուրբ Հռիփսիմե եկեղեցի, sometimes Hripsimeh) is a seventh century Armenian Apostolic church in the city of Vagharshapat (Etchmiadzin), Armenia. It is one of the oldest surviving churches in the country. The church was erected by Catholicos Komitas to replace the original mausoleum built by Catholicos Sahak the Great in 395 AD that contained the remains of the martyred Saint Hripsime to whom the church is dedicated. The current structure was completed in 618 AD. It is known for its fine Armenian-style architecture of the classical period, which has influenced many other Armenian churches since. It was listed as a UNESCO World Heritage Site along with other nearby churches, including Etchmiadzin Cathedral, Armenia's mother church, in 2000. ",
            imageNames: [
                "hripsime_1",
                "hripsime_2",
                "hripsime_3",
            ],
            link: "https://en.wikipedia.org/wiki/Saint_Hripsime_Church"),
        ChurchesLocations(
            name: "Saint Gayane Church",
            cityName: "Etchmiadzin, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 40.157666074731004, longitude: 44.29179818217184),
            description: "The Saint Gayane Church (Armenian: Սուրբ Գայանե եկեղեցի; pronounced Surb Gayane) is a 7th-century Armenian church in Vagharshapat (Etchmiadzin), the religious center of Armenia. It is located within walking distance from the Etchmiadzin Cathedral of 301. St. Gayane was built by Catholicos Ezra I in the year 630. Its design has remained unchanged despite partial renovations of the dome and some ceilings in 1652.",
            imageNames: [
                "gayane_1",
                "gayane_2",
                "gayane_3",
            ],
            link: "https://en.wikipedia.org/wiki/Saint_Gayane_Church"),
        ChurchesLocations(
            name: "Sevanavank",
            cityName: "Sevan Peninsula, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 40.56405854456797, longitude: 45.011080426359),
            description: "Sevanavank (Armenian: Սևանավանք; meaning Sevan Monastery) is a monastic complex located on a peninsula at the northwestern shore of Lake Sevan in the Gegharkunik Province of Armenia, not far from the town of Sevan. Initially the monastery was built at the southern shore of a small island. After the artificial draining of Lake Sevan, which started in the era of Joseph Stalin, the water level fell about 20 metres, and the island transformed into a peninsula. At the southern shore of this newly created peninsula, a guesthouse of the Armenian Writers' Union was built. The eastern shore is occupied by the Armenian president's summer residence, while the monastery's still active seminary moved to newly constructed buildings at the northern shore of the peninsula. ",
            imageNames: [
                "sevanavank_1",
                "sevanavank_2",
                "sevanavank_3",
            ],
            link: "https://en.wikipedia.org/wiki/Sevanavank"),
        ChurchesLocations(
            name: "Armenian Temple Complex",
            cityName: "Moscow, Russia",
            coordinates: CLLocationCoordinate2D(latitude: 55.78779979613707, longitude: 37.62143918524208),
            description: "Armenian Temple Complex (arm. Հայկական տաճարային համալիր) is a temple complex in Moscow, at the corner of Olympic Avenue and Trifonovskaya Street. Valid since 2013. It is the residence of the patriarchal exarch, head of the Russian and New Nakhichevan Diocese of the Armenian Apostolic Church.",
            imageNames: [
                "moscow_1",
                "moscow_2",
                "moscow_3",
            ],
            link: "https://museumstudiesabroad.org/armenian-temple-moscow/"),
    ]
    
}
