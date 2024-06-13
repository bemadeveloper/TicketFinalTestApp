//
//  HomeView.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation
import SwiftUI
import Combine

struct HomeView: View {
    
    @StateObject private var viewModel = OffersViewModel()
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .top){
                Rectangle()
                    .frame(maxHeight: 300)
                    .background(Color(red: 12/255, green: 12/255, blue: 12/255))
                
                VStack(spacing: 20){
                    Text("Поиск дешевых авиабилетов")
                        .frame(maxWidth: .infinity, maxHeight:70,alignment: .center)
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.bottom, 8)
                    WindowView()
                    
                    Text("Музыкально отлететь ")
                        .frame(maxWidth: .infinity, maxHeight:90,alignment: .leading)
                        .font(.system(size: 28))
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.bottom, -50)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 20) {
                            ForEach(viewModel.offers) { offer in
                                VStack(alignment: .leading) {
                                    getImage(for: offer.id)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 150)
                                        .clipped()
                                        .cornerRadius(10)
                                    
                                    Text(offer.title)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(offer.town)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    
                                    HStack {
                                        Text("Цена: \(formatPrice(offer.price.value)) руб.")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                        Image(systemName: "rublesign.circle")
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding()
                                .background(Color.black.opacity(0.2))
                                .cornerRadius(10)
                            }
                        }
                        .padding(.vertical)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(red: 12/255, green: 12/255, blue: 12/255))
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

