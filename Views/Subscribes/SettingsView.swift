//
//  SettingsView.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView{
            ZStack(alignment: .top){
                Rectangle()
                    .frame(maxHeight: 200)
                    .background(Color.accentColor)
                    .foregroundColor(Color.accentColor)
                VStack{
                    HeaderView(name: "Profile", greeting: "", showGreeting: false, center: true)
                    ProfileView()
                        .padding(.bottom, 350)
                    
                        .padding(.vertical)
                    Spacer()
                }
                .padding(.horizontal)
            }
            .background(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.background(Color.accentColor)

        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
