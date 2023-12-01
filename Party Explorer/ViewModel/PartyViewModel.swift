//
//  PartyViewModel.swift
//  Party Explorer
//
//  Created by Tilak Shakya on 01/12/23.
//

import Foundation
import Combine

class PartyViewModel: ObservableObject {
    @Published var allParties: [Party] = []
    
    // Sample data for random generation
    private let sampleNames = ["Beach Bash", "Rooftop Party", "Garden Getaway", "Urban Escape", "Sunset Soiree"]
    private let sampleImageURLs = [
        URL(string: "https://spaceshipsandlaserbeams.com/wp-content/uploads/2011/06/Boys-Beach-Themed-Birthday-Party-Balloon-Decorations-660x436.jpg")!,
        URL(string: "https://cdn.onekindesign.com/wp-content/uploads/2019/04/Chic-Shed-Backyard-Garden-Living-01-1-Kindesign.jpg")!,
        URL(string: "https://assets.gqindia.com/photos/5cdc2ee05e4ee6b08a14bc7d/16:9/w_2560%2Cc_limit/Rooftopparty.jpg")!,
        URL(string: "https://cdn-61c28791c1ac18f2a85463df.closte.com/wp-content/uploads/2022/03/relohotel-event-slide01.jpg")!,
        URL(string: "https://worldredeye.com/wp-content/uploads/2022/09/15/0-1f4a4806.jpg")!
    ]
    
    
    init() {
        for _ in 0..<3 {
            allParties.append(generateRandomParty())
        }
    }

    func addNewParty() {
        allParties.append(generateRandomParty())
    }
    
    private func generateRandomParty() -> Party {
        let randomName = sampleNames.randomElement()!
        let randomImageURL = sampleImageURLs.randomElement()!
        let randomPrice = Double.random(in: 20...100)
        let startDate = Date()
        let endDate: Date? = Bool.random() ? Calendar.current.date(byAdding: .day, value: Int.random(in: 1...5), to: startDate) : nil
        let randomGoing = Int.random(in: 1...100)

        return Party(name: randomName, bannerImageURL: randomImageURL, price: randomPrice, startDate: startDate, endDate: endDate, amountGoing: randomGoing)
    }

    func searchParties(by name: String) -> [Party] {
        guard !name.isEmpty else {
            return allParties
        }
        return allParties.filter { $0.name.lowercased().contains(name.lowercased()) }
    }
}


