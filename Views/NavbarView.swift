//
//  NavbarView.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation
import SwiftUI

struct Navbar: View {
    var sampleOffers: [Offer] = [
            Offer(id: 1, title: "Die Antwoord", town: "Будапешт", price: Offer.Price(value: 5000)),
            Offer(id: 2, title: "Socrat&Lera", town: "Санкт-Петербург", price: Offer.Price(value: 1999)),
            Offer(id: 3, title: "Лампабикт", town: "Москва", price: Offer.Price(value: 2390))
        ]
    
    init() {
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor.systemGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor.systemBlue
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
            UITabBar.appearance().standardAppearance = appearance
        }
    
    @State private var selectedTab = 0
    
    var body: some View {
            
            TabView{
                HomeView()
                    .tabItem{
                        Label("Авиабилеты", systemImage: "airplane")
                    }
                TicketsView(tickets: sampleOffers)
                    .tabItem{
                        Label("Отели", systemImage: "bed.double.fill")
                    }
                HistoryView()
                    .tabItem{
                        Label("Короче", systemImage: "location.north.circle.fill")
                    }
                SettingsView()
                    .tabItem{
                        Label("Подписки", systemImage: "bell.fill")
                    }
                ProfileView()
                    .tabItem {
                        Label("Профиль",
                              systemImage: "person.fill")
                    }
            }
            .onAppear(){
                UITabBar.appearance().backgroundColor = .black
            }
            
        }
    }

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        Navbar()
    }
}
