//
//  Offer.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation

struct Offer: Identifiable, Decodable {
    let id: Int
    let title: String
    let town: String
    let price: Price
    
    struct Price: Decodable {
        let value: Int
    }
}
