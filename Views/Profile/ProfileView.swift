//
//  ProfileView.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        VStack{
            
            ProfileSection(name: "Julian Chin A Foeng", email: "julianpm.caf@gmail.com")
                .padding(.vertical)
            Text("Settings")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                
            SettingField(title: "Payment Method", icon: "checkmark.seal.fill")
                .cornerRadius(10)
            SettingField(title: "Language", icon: "globe")
                .cornerRadius(10)
            SettingField(title: "Dark Theme (Beta)", icon: "dot.square.fill")
                .cornerRadius(10)
            
            Text("Support")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            SettingField(title: "Contact Support", icon: "wrench.fill")
                .cornerRadius(10)

        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.25), radius: 30, x: 0, y: 0)
    }
}

struct ProfileSection: View{
    let name: String
    let email: String
    var body: some View{
        VStack{
            IconRounded(icon: "airplane", background: .black, width: 60, height: 60)
            
            Text(name)
                .fontWeight(.semibold)
            Text(email)
                .foregroundColor(.gray)
        }
    }
}
struct SettingField: View{
    let title: String
    var icon: String = ""
    var body: some View{
        HStack{
            Image(systemName: icon)
                .padding(.leading)
            VStack(alignment: .leading){
                Text(title)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .font(.subheadline)
            }
            Spacer()
            Image(systemName: "arrow.right")
                .padding(.trailing)
            .padding(.leading)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(EdgeInsets(top: 15, leading: 0, bottom: 8, trailing: 0))
        .background(Color("TextField"))
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

