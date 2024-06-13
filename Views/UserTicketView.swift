//
//  UserTicketView.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation
import SwiftUI

struct UserTicketView: View {
    var ticket: Offer
    var textColor: Color = Color.gray
    var titleColor: Color = Color.black
    var backgroundColor: Color = Color("TextField")
    
    var body: some View {
        VStack(spacing: 0){
            TopSectionTicket(title: ticket.title, price: ticket.price.value, backgroundColor: backgroundColor)
            BottomSectionTicket(from: "From", to: ticket.town, date: "10 June 2023", duration: "2 Hour 50 min", textColor: textColor, titleColor: titleColor, backgroundColor: backgroundColor)
        }
    }
}

struct TopSectionTicket: View {
    var title: String
    var price: Int
    var backgroundColor: Color = Color("TextField")
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text("$\(price)")
        }
        .padding([.vertical, .horizontal])
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct BottomSectionTicket: View {
    var from: String
    var to: String
    var date: String
    var duration: String
    var textColor: Color = Color.gray
    var titleColor: Color = Color.black
    var backgroundColor: Color = Color("TextField")
    
    var body: some View {
        VStack {
            HStack {
                Text(from)
                    .foregroundColor(textColor)
                Spacer()
                Text(to)
                    .foregroundColor(textColor)
            }
            HStack {
                Text("From")
                    .bold()
                    .foregroundColor(titleColor)
                Spacer()
                Text("To")
                    .bold()
                    .foregroundColor(titleColor)
            }
            HStack {
                Text(date)
                    .font(.caption)
                    .foregroundColor(textColor)
                Spacer()
                Text(duration)
                    .font(.caption)
                    .foregroundColor(textColor)
                Spacer()
                Text(date)
                    .font(.caption)
                    .foregroundColor(textColor)
            }
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct UserTicketView_Previews: PreviewProvider {
    static var previews: some View {
        let ticket = Offer(id: 1, title: "Die Antwoord", town: "Будапешт", price: Offer.Price(value: 5000))
        UserTicketView(ticket: ticket)
    }
}
