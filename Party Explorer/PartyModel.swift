//
//  PartyModel.swift
//  Party Explorer
//
//  Created by Tilak Shakya on 01/12/23.
//

import Foundation

struct Party: Identifiable {
    let id = UUID()
    var name: String
    var bannerImageURL: URL
    var price: Double
    var startDate: Date
    var endDate: Date?
    var amountGoing: Int
}
