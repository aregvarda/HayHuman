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
        //Армавир:
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
            description: "Saint Hripsime Church (Armenian: Սուրբ Հռիփսիմե եկեղեցի, sometimes Hripsimeh) is a seventh century Armenian Apostolic church in the city of Vagharshapat (Etchmiadzin), Armenia. It is one of the oldest surviving churches in the country. The church was erected by Catholicos Komitas to replace the original mausoleum built by Catholicos Sahak the Great in 395 AD that contained the remains of the martyred Saint Hripsime to whom the church is dedicated. The current structure was completed in 618 AD. It is known for its fine Armenian-style architecture of the classical period, which has influenced many other Armenian churches since. It was listed as a UNESCO World Heritage Site along with other nearby churches, including Etchmiadzin Cathedral, Armenia's mother church, in 2000.",
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
    
        //Гегаркуник:
        ChurchesLocations(
            name: "Sevanavank",
            cityName: "Sevan Peninsula, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 40.56405854456797, longitude: 45.011080426359),
            description: "Sevanavank (Armenian: Սևանավանք; meaning Sevan Monastery) is a monastic complex located on a peninsula at the northwestern shore of Lake Sevan in the Gegharkunik Province of Armenia, not far from the town of Sevan. Initially the monastery was built at the southern shore of a small island. After the artificial draining of Lake Sevan, which started in the era of Joseph Stalin, the water level fell about 20 metres, and the island transformed into a peninsula. At the southern shore of this newly created peninsula, a guesthouse of the Armenian Writers' Union was built. The eastern shore is occupied by the Armenian president's summer residence, while the monastery's still active seminary moved to newly constructed buildings at the northern shore of the peninsula.",
            imageNames: [
                "sevanavank_1",
                "sevanavank_2",
                "sevanavank_3",
            ],
            link: "https://en.wikipedia.org/wiki/Sevanavank"),
        //Арагацотнская область:
        ChurchesLocations(
            name: "Church of Saint John",
            cityName: "Mastara, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 40.451971725866706, longitude: 43.88394852635579),
            description: "The Church of Saint John (Surp Hovanes), also known as Mastara Church, in Mastara, Armenia dates from the 5th century. It features a variation of the cruciform plan and central cupola'd church. In accordance with its square plan, the four projecting apses, inward-facing circular and outward facing polygonal, offer the requisite supports to hold up the imposing polygonal cupola. The complex church designs are like those in Avan and St. Hripsime Church, Echmiadzin. ",
            imageNames: [
                "mastara-1",
            ],
            link: "https://en.wikipedia.org/wiki/Church_of_Saint_John,_Mastara"),
        //Арарат:
        ChurchesLocations(
            name: "Khor Virap",
            cityName: "Lusarat, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 39.878501146880545, longitude: 44.576229897503964),
            description: "Khor Virap (Armenian: Խոր Վիրապ, lit. 'deep dungeon') is an Armenian monastery located in the Ararat Plain in Armenia, near the closed border with Turkey, about 8 kilometres (5.0 mi) south of Artashat, Ararat Province, within the territory of ancient Artaxata. The monastery was host to a theological seminary and was the residence of Armenian Catholicos.",
            imageNames: [
                "khor_virap-1",
            ],
            link: "https://en.wikipedia.org/wiki/Khor_Virap"),
        //Котайкская область:
        ChurchesLocations(
            name: "Geghard",
            cityName: "Kotayk Province, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 40.1409825190403, longitude: 44.81865864521152),
            description: "Geghard (Armenian: Գեղարդ, meaning 'spear') is a medieval monastery in the Kotayk province of Armenia, being partially carved out of the adjacent mountain, surrounded by cliffs. It is listed as a UNESCO World Heritage Site with enhanced protection status. ",
            imageNames: [
                "geghard-1",
            ],
            link: "https://en.wikipedia.org/wiki/Geghard"),
        //Лорийская область:
        ChurchesLocations(
            name: "Odzun Church",
            cityName: "Odzun, Lori Province, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 41.05100229722745, longitude: 44.616494468703195),
            description: "Odzun Church (Armenian: Օձունի եկեղեցի) is an Armenian basilica constructed around the 5th–7th century in the Odzun village of the Lori Province of Armenia.",
            imageNames: [
                "odzun-1",
            ],
            link: "https://en.wikipedia.org/wiki/Odzun_Church"),
        //Ширакская область:
        ChurchesLocations(
            name: "Harichavank Monastery",
            cityName: "Harich, Shirak Province, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 40.60650820452112, longitude: 43.99959784716005),
            description: "The Harichavank (Armenian: Հառիճավանք; transliterated as Harijavank or Harichavank) is 7th century Armenian monastery located near the village of Harich (Armenian: Հառիճ) in the Shirak Province of Armenia. The village is 3 km southeast of the town of Artik.",
            imageNames: [
                "harichavank-1",
            ],
            link: "https://en.wikipedia.org/wiki/Harichavank_Monastery"),
        //Сюник:
        ChurchesLocations(
            name: "Tatev Monastery",
            cityName: "Tatev, Syunik Province, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 39.37931689298995, longitude: 46.25037904433544),
            description: "The Tatev Monastery (Armenian: Տաթևի վանք, romanized: Tat'evi vank') is a 9th-century Armenian Apostolic monastery located on a large basalt plateau near the village of Tatev in the Syunik Province in southeastern Armenia. The term 'Tatev' usually refers to the monastery. The monastic ensemble stands on the edge of a deep gorge of the Vorotan River. Tatev is known as the bishopric seat of Syunik and played a significant role in the history of the region as a center of economic, political, spiritual and cultural activity. ",
            imageNames: [
                "tatev-1",
            ],
            link: "https://en.wikipedia.org/wiki/Tatev_Monastery"),
        //Тавуш:
        ChurchesLocations(
            name: "Haghartsin Monastery",
            cityName: "Dilijan, Tavush Province, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 40.80189023721691, longitude: 44.89101199753095),
            description: "Haghartsin (Armenian: Հաղարծին) is a 13th-century monastery located near the town of Dilijan in the Tavush Province of Armenia. It was built between the 10th and 13th centuries (in the 12th under Khachatur of Taron); much of it under the patronage of the Bagratuni Dynasty.",
            imageNames: [
                "aghartsin-1",
            ],
            link: "https://en.wikipedia.org/wiki/Haghartsin_Monastery"),
        //Вайоцдзорская область:
        ChurchesLocations(
            name: "Noravank",
            cityName: "Amaghu Valley, Vayots Dzor Province, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 39.69595337441365, longitude: 45.23768657180624),
            description: "Noravank (Armenian: Նորավանք, lit. 'new monastery') is a 13th-century Armenian monastery, located 122 km from Yerevan in a narrow gorge made by the Amaghu River, near the town of Yeghegnadzor in Armenia. The gorge is known for its tall, sheer, brick-red cliffs, directly across from the monastery. The monastery is best known for its two-storey Surb Astvatsatsin (Holy Mother of God) Church, which grants access to the second floor by way of a narrow stone-made staircase jutting out from the face of building, one of the earliest examples of cantilever architecture.",
            imageNames: [
                "noravank-1",
            ],
            link: "https://en.wikipedia.org/wiki/Noravank"),
        //Ереван:
        ChurchesLocations(
            name: "Saint Gregory the Illuminator Cathedral",
            cityName: "Yerevan, Armenia",
            coordinates: CLLocationCoordinate2D(latitude: 40.17310224344604, longitude: 44.51658770986182),
            description: "The Saint Gregory the Illuminator Cathedral (Armenian: Սուրբ Գրիգոր Լուսավորիչ մայր եկեղեցի, Surb Grigor Lusavorich mayr yekeghetsi), also known as the Yerevan Cathedral is the largest cathedral of the Armenian Apostolic Church. It is located in the Kentron District (Central District) of Yerevan, the capital of Armenia, and is one of the largest religious buildings in the South Caucasus along with the Holy Trinity Cathedral of Tbilisi (known as the Sameba Cathedral). Adjacent to the General Andranik metro station, it is visible from many areas of Yerevan. ",
            imageNames: [
                "gregory-1",
            ],
            link: "https://en.wikipedia.org/wiki/Saint_Gregory_the_Illuminator_Cathedral,_Yerevan"),
        //Арцах:
        ChurchesLocations(
            name: "Gandzasar monastery",
            cityName: "Martakert, Artsakh (de facto)",
            coordinates: CLLocationCoordinate2D(latitude: 40.05733545058956, longitude: 46.53056635517934),
            description: "Gandzasar (Armenian: Գանձասար) is a 13th-century Armenian Apostolic cathedral (historically a monastery) near the village of Vank in the Martakert Province of the self-proclaimed Republic of Artsakh, de jure in the Kalbajar District of Azerbaijan. It has historically been the region's most important church since its foundation. One of the finest pieces of Armenian architecture of the mid-1200s, the building is best known among scholars for its richly decorated dome.",
            imageNames: [
                "gandzasar-1",
            ],
            link: "https://en.wikipedia.org/wiki/Gandzasar_monastery"),
        //Азербайджан:
        ChurchesLocations(
            name: "Dadivank",
            cityName: "Vəng, Azerbaijan",
            coordinates: CLLocationCoordinate2D(latitude: 40.16173071891234, longitude: 46.28836149806767),
            description: "Dadivank (Armenian: Դադիվանք), or Khutavank (Armenian: Խութավանք, lit. 'monastery on the hill'), is an Armenian Apostolic monastery in the Kalbajar District of Azerbaijan, bordering the Martakert Province of the self-proclaimed Republic of Artsakh. It was built between the 9th and 13th centuries. One of the main monastic complexes of medieval Armenia.",
            imageNames: [
                "dadivank-1",
            ],
            link: "https://en.wikipedia.org/wiki/Dadivank"),
        //Ани:
        ChurchesLocations(
            name: "Horomos Monastery",
            cityName: "near Ani, Turkey (the monastery is almost destroyed)",
            coordinates: CLLocationCoordinate2D(latitude: 40.52061096498222, longitude: 43.628770598090775),
            description: "Horomos (Armenian: Հոռոմոս), also known as Horomosivank or Ghoshavank, is an abandoned and ruined medieval Armenian monastic complex about 15 kilometers northeast of the ruins of Ani (the capital of Bagratid Armenia) in present-day eastern Turkey. With its collection of churches, chapels and tombs, Horomos has been described as one of the most significant spiritual and cultural religious centers in medieval Armenia and one of the largest in all the Christian East.",
            imageNames: [
                "hromos-1",
            ],
            link: "https://en.wikipedia.org/wiki/Horomos"),
        //Ван:
        ChurchesLocations(
            name: "Varagavank",
            cityName: "Van Province, Turkey (the monastery was destroyed)",
            coordinates: CLLocationCoordinate2D(latitude: 38.451046255725316, longitude: 43.46078158316967),
            description: "Varagavank (Armenian: Վարագավանք, 'Monastery of Varag'; Turkish: Yedi Kilise, 'Seven Churches') was an Armenian monastery on the slopes of Mount Erek, 9 km (5.6 mi) southeast of the city of Van, in eastern Turkey.\n\nThe monastery was founded in the early 11th century by Senekerim-Hovhannes Artsruni, the Armenian King of Vaspurakan, on a preexisting religious site. Initially serving as the necropolis of the Artsruni kings, it eventually became the seat of the archbishop of the Armenian Church in Van.[5] The monastery has been described as one of the great monastic centers of the Armenian church by Ara Sarafian and the richest and most celebrated monastery of the Lake Van area by Robert H. Hewsen.",
            imageNames: [
                "vargavank-1",
            ],
            link: "https://en.wikipedia.org/wiki/Varagavank"),
        ChurchesLocations(
            name: "Narekavank",
            cityName: "Van Province, Turkey (the monastery was destroyed)",
            coordinates: CLLocationCoordinate2D(latitude: 38.296875, longitude: 42.928256),
            description: "Narekavank (Armenian: Նարեկավանք, 'Monastery of Narek', Western Armenian: Nareg) was a tenth-century Armenian monastery in the historic province of Vaspurakan, near the southern shores of Lake Van, in present-day Gevaş district in the Van Province in eastern Turkey. The monastery was one of the most prominent in medieval Armenia and had a major school. The poet Gregory of Narek (Grigor Narekatsi) notably flourished at the monastery. It was abandoned in 1915 during the Armenian genocide, and reportedly demolished around 1951. A mosque now stands on its location.",
            imageNames: [
                "narekavank-1",
            ],
            link: "https://en.wikipedia.org/wiki/Narekavank"),
        ChurchesLocations(
            name: "Saint Bartholomew Monastery",
            cityName: "Van Province, Turkey (the monastery was destroyed)",
            coordinates: CLLocationCoordinate2D(latitude: 38.149942, longitude: 44.212925),
            description: "Saint Bartholomew Monastery (Armenian: Սուրբ Բարդուղիմեոսի վանք, Surb Barduğimeosi vank' ; Western Armenian: Surp Part'uğimeosi vank' ) was a medieval Armenian monastery in the historic province of Vaspurakan, 23 km north-east from the town of Başkale, in present-day Turkey's Van Province, near the Iranian border. The monastery was built on the traditional site of martyrdom of Bartholomew the Apostle, who is reputed to have brought Christianity to Armenia in the first century. Along with Thaddeus the Apostle, Bartholomew is considered the patron saint of the Armenian Apostolic Church. It was a prominent pilgrimage site prior to the Armenian genocide. Today, it is heavily ruined and the dome entirely gone.",
            imageNames: [
                "baartholomeuVan-1",
            ],
            link: "https://en.wikipedia.org/wiki/Saint_Bartholomew_Monastery"),
        ChurchesLocations(
            name: "Lim Monastery",
            cityName: "Van Province, Turkey (the monastery was destroyed)",
            coordinates: CLLocationCoordinate2D(latitude: 38.866667, longitude: 43.35),
            description: "Adır Island (Turkish: Adır Adası) or Lim Island (Armenian: Լիմ կղզի Lim kghzi, Kurdish: Girava Lîm), is the largest island in Lake Van, located in the North East part of the lake. During the Armenian genocide upwards of 12,000 Armenian women and children, crossed to the isle over a period of three days while a few dozen men covered their retreat from Hamidiye regiments. The Situation became soon critical because of a lack of food.\n\nThe Armenian Monastery on the island was called St. George or Sourp Kevork. It was built in 1305 and expanded in 1621 and 1766. The Monastery is currently in ruins. The island also contains a cemetery of Armenian khachkars.",
            imageNames: [
                "lim-1",
            ],
            link: "https://en.wikipedia.org/wiki/Ad%C4%B1r_Island"),
        ChurchesLocations(
            name: "Cathedral of the Holy Cross",
            cityName: "Van Province, Turkey",
            coordinates: CLLocationCoordinate2D(latitude: 38.3403, longitude: 43.0369),
            description: "The Cathedral of the Holy Cross (Armenian: Սուրբ Խաչ եկեղեցի, romanized: Surp Khachʿ egeghetsʿi, Turkish: Akdamar Kilisesi or Surp Haç Kilisesi) on Aghtamar Island, in Lake Van in eastern Turkey, is a medieval Armenian Apostolic cathedral, built as a palatine church for the kings of Vaspurakan and later serving as the seat of the Catholicosate of Aghtamar.",
            imageNames: [
                "akhtamar-1",
            ],
            link: "https://en.wikipedia.org/wiki/Cathedral_of_the_Holy_Cross,_Aghtamar"),
        //Муш:
        ChurchesLocations(
            name: "Surb Karapet Monastery",
            cityName: "Muş Province, Turkey (the monastery was destroyed)",
            coordinates: CLLocationCoordinate2D(latitude: 38.960779092034585, longitude: 41.19182255514805),
            description: "Surb Karapet Monastery (Armenian: Մշո Սուրբ Կարապետ վանք, Msho Surb Karapet vank, also known by other names) was an Armenian Apostolic monastery in the historic province of Taron, about 30 km (19 mi) northwest of Mush (Muş), in present-day eastern Turkey.\n\nSurb Karapet translates to 'Holy Precursor' and refers to John the Baptist, whose remains are believed to have been stored at the site by Gregory the Illuminator in the early fourth century. The monastery subsequently served as a stronghold of the Mamikonians—the princely house of Taron, who claimed to be the holy warriors of John the Baptist, their patron saint. It was expanded and renovated many times in later centuries. By the 20th century, it was a large fort-like enclosure with four chapels.",
            imageNames: [
                "mush-1",
            ],
            link: "https://en.wikipedia.org/wiki/Surb_Karapet_Monastery"),
        //Сивас
        ChurchesLocations(
            name: "Surb Nshan Monastery",
            cityName: "Sivas Province, Turkey (the monastery was destroyed)",
            coordinates: CLLocationCoordinate2D(latitude: 39.840861, longitude: 36.942373),
            description: "Sourb Nshan monastery was established by prince Atom-Ashot, the son of King Senekerim. The monastery was named after a celebrated relic that Senekerim had brought from Varagavank monastery, and which was returned there after his death. This was one of notable center of enlightenment and scholarship of Lesser Armenia during Byzantine, Seljuk Sultanate of Rum and Ottoman reigns until the Armenian genocide in 1915. In 1915 Sourb Nshan monastery was the main repository of medieval Armenian manuscripts in the Sebastia region and at least 283 manuscripts are recorded. The library was not destroyed during the Armenian Genocide and most of the manuscripts survived. In 1918 about 100 of them were transferred to the Armenian Patriarchate in Jerusalem. ",
            imageNames: [
                "sivas-1",
            ],
            link: "https://en.wikipedia.org/wiki/Surb_Nshan_Monastery"),
        //Москва:
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
