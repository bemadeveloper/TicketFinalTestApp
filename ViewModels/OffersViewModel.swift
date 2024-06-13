//
//  OffersViewModel.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation
import Combine
import SwiftUI


class OffersViewModel: ObservableObject {
    @Published var offers: [Offer] = []
    
    private var cancellable: AnyCancellable?
    
    init() {
        loadOffers()
    }
    
    func loadOffers() {
        guard let url = URL(string: "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd") else {
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: OffersResponse.self, decoder: JSONDecoder())
            .replaceError(with: OffersResponse(offers: []))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.offers = $0.offers
            }
    }
}

struct OffersResponse: Decodable {
    let offers: [Offer]
}

// Функция для форматирования цены с разделением разрядов пробелами
func formatPrice(_ value: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = " "
    return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
}

// Функция для получения изображения по id
func getImage(for id: Int) -> Image {
    switch id {
    case 1:
        return Image("image1")
    case 2:
        return Image("image2")
    case 3:
        return Image("image3") 
    default:
        return Image(systemName: "photo")
    }
}
