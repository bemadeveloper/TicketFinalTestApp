//
//  TicketsView.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation
import SwiftUI

struct TicketsView: View {
    var tickets: [Offer]
    
    var body: some View {
        VStack(spacing: 0){
            VStack{
                HeaderView(name: "My Ticket", greeting: "", showGreeting: false, center: true)
                    .frame(maxWidth: .infinity)
                    .padding([.horizontal, .bottom])
                    .background(Color.accentColor)
                BottomSectionTicket(from: "From", to: "Destination", date: "Date", duration: "Duration", textColor: .white, titleColor: .white, backgroundColor: Color.accentColor)
                    .background(Color.accentColor)
                    .padding(.bottom)
            }
            .background(Color.accentColor)
            ScrollView{
                Spacer(minLength: 30)
                ForEach(tickets) { ticket in
                    UserTicketView(ticket: ticket)
                        .padding(.vertical, 5)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleOffers = [
            Offer(id: 1, title: "Die Antwoord", town: "Будапешт", price: Offer.Price(value: 5000)),
            Offer(id: 2, title: "Socrat&Lera", town: "Санкт-Петербург", price: Offer.Price(value: 1999)),
            Offer(id: 3, title: "Лампабикт", town: "Москва", price: Offer.Price(value: 2390))
        ]
        TicketsView(tickets: sampleOffers)
    }
}
