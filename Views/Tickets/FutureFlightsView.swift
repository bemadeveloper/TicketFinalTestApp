//
//  FutureFlightsView.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation
import SwiftUI

struct FutureFlightsView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Upcoming Flights")
                    .fontWeight(.bold)
                Spacer()
                Text("See All")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            
            Flight(name: "Florida", price: 100)
            Flight(name: "Florida", price: 100)
            Flight(name: "Florida", price: 100)
            Flight(name: "Florida", price: 100)
            
        }
    }
}

struct Flight: View{
    let name: String
    let price: Int
    var body: some View{
        HStack{
            Text(name)
                .fontWeight(.medium)
            Spacer()
            Text("$\(price)")
                .fontWeight(.bold)
        }
        .padding()
        
        .background(Color("TextField"))
        .cornerRadius(10)
    }
}

struct FutureFlightsView_Previews: PreviewProvider {
    static var previews: some View {
        FutureFlightsView()
    }
}
