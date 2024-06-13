//
//  HistoryView.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation
import SwiftUI

struct HistoryView: View {
    @StateObject var viewModel = ArticleViewModel()
    var body: some View {
        VStack(spacing: 0){
            HeaderView(name: "History", greeting: "", showGreeting: false, center: true)
                .frame(maxWidth: .infinity)
                .padding([.bottom, .horizontal])
                .background(Color.accentColor)
            ScrollView{
                VStack(alignment: .leading){
                    Text("Today")
                        .fontWeight(.semibold)
                        .padding(.top, 40)
                    ForEach(viewModel.articles, id: \.self){ article in
                        ArticleView(icon: article.icon, title: article.title, description: article.description, date: "20 June 2023", time: "8:30 PM")
                    }
                    Text("Yesterday")
                        .fontWeight(.semibold)
                        .padding(.top, 40)
                    
                }
                .padding(.horizontal)
                .background(Color.white)
            }
            .onAppear{
                viewModel.fetchArticle()
            }
        }
    }
}
struct ArticleView: View{
    let icon: String
    let title: String
    let description: String
    let date: String
    let time: String
    var body: some View{
        HStack(alignment: .top){
            
            IconRounded(icon: icon, color: .black,background: Color("TextField"))
            VStack(alignment: .leading){
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(description)
                    
                    .font(.caption)
                    .foregroundColor(.gray)
                HStack{
                    Text(date)
                    Text("•")
                    Text(time)
                }
                .padding(.top, 5)
                .font(.caption)
                
                .foregroundColor(.gray)
            }
            
        }
        
        
        .frame(maxWidth: .infinity, alignment: .leading)
        Divider()
    }
}
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
