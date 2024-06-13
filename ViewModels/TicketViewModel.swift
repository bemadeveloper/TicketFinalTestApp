//
//  TicketViewModel.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation

class TicketViewModel: ObservableObject{
    @Published var tickets: [Offer] = []
    func fetchTicket(){
        
        guard let url = Bundle.main.url(forResource: "Tickets", withExtension: "json") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _,
            error in
            guard let data = data, error == nil else{
                return
            }

            do {
                let tickets = try JSONDecoder().decode([Offer].self, from: data)
                DispatchQueue.main.async {
                    self?.tickets = tickets
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}
