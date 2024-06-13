//
//  WindowView.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation
import SwiftUI

struct WindowView: View {
    @State var fromLocation: String = UserDefaults.standard.string(forKey: "fromLocation") ?? ""
    @State var toLocation: String = UserDefaults.standard.string(forKey: "toLocation") ?? ""

    var body: some View {
        VStack {
            CustomTextField(title: "Откуда - Москва", icon: "airplane", text: $fromLocation)
                .cornerRadius(10)
                .padding([.bottom], 5)
            CustomTextField(title: "Куда - Турция", icon: "house", text: $toLocation, showModalOnTap: true, showClearButton: true)
                .cornerRadius(10)
                .padding([.bottom], 5)
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(20)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.25), radius: 30, x: 0, y: 0)
        .onAppear {
            fromLocation = UserDefaults.standard.string(forKey: "fromLocation") ?? ""
            toLocation = UserDefaults.standard.string(forKey: "toLocation") ?? ""
        }
    }
}

struct CustomTextField: View {
    let title: String
    var icon: String = ""
    var includeImage: Bool = true
    @Binding var text: String
    var showModalOnTap: Bool = false
    var showClearButton: Bool = false
    @State private var showModal: Bool = false
    @State private var recentEntries: [String] = []

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                HStack {
                    if includeImage {
                        Image(systemName: icon)
                            .padding(.leading)
                    }
                    VStack(alignment: .leading) {
                        Text(title)
                            .foregroundColor(Color("Subtext"))
                            .font(.subheadline)
                        HStack {
                            TextField("", text: $text, onCommit: {
                                UserDefaults.standard.set(self.text, forKey: title)
                            })
                            .fontWeight(.semibold)
                            .onChange(of: text) { newValue in
                                let filtered = newValue.filter { "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя".contains($0) }
                                if text != filtered {
                                    text = filtered
                                }
                                UserDefaults.standard.set(filtered, forKey: title)
                                saveToRecentEntries(filtered)
                            }
                            .onAppear {
                                text = UserDefaults.standard.string(forKey: title) ?? ""
                                loadRecentEntries()
                            }
                            .onDisappear {
                                UserDefaults.standard.set(self.text, forKey: title)
                            }
                            .keyboardType(.default)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                            .onTapGesture {
                                if showModalOnTap {
                                    showModal.toggle()
                                }
                            }
                            if showClearButton {
                                Button(action: {
                                    text = ""
                                    UserDefaults.standard.set(text, forKey: title)
                                }) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.gray)
                                }
                                .padding(.top, 8)
                                .padding(.trailing, 8)
                            }
                        }
                    }
                    .padding(.leading)
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .background(Color("TextField"))
                .cornerRadius(10)
                
                if !recentEntries.isEmpty {
                    List {
                        ForEach(recentEntries, id: \.self) { entry in
                            Text(entry)
                                .onTapGesture {
                                    text = entry
                                }
                        }
                    }
                    .frame(maxHeight: 150)
                }
            }
            .sheet(isPresented: $showModal) {
                ModalView(fromLocation: WindowView().fromLocation, toLocation: WindowView().toLocation)
            }
        }
    }

    private func saveToRecentEntries(_ entry: String) {
        var entries = UserDefaults.standard.stringArray(forKey: title) ?? []
        if !entries.contains(entry) {
            entries.append(entry)
            if entries.count > 5 {
                entries.removeFirst()
            }
            UserDefaults.standard.set(entries, forKey: title)
        }
    }

    private func loadRecentEntries() {
        recentEntries = UserDefaults.standard.stringArray(forKey: title) ?? []
    }
}

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var text = ""
    
    @State var fromLocation: String
    @State var toLocation: String
    
    var body: some View {
        VStack {
            CustomTextField(title: "Откуда - Москва", icon: "airplane", text: $fromLocation)
                .cornerRadius(10)
                .padding([.bottom], 5)
            CustomTextField(title: "Куда - Турция", icon: "house", text: $toLocation, showModalOnTap: true, showClearButton: true)
                .cornerRadius(10)
                .padding([.bottom], 5)
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(20)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.25), radius: 30, x: 0, y: 0)
        .onAppear {
            fromLocation = UserDefaults.standard.string(forKey: "fromLocation") ?? ""
            toLocation = UserDefaults.standard.string(forKey: "toLocation") ?? ""
        }
        .overlay(
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    .padding()
            }
            , alignment: .topTrailing
        )
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    VStack(spacing: 0) {
                        Image(systemName: "command")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .frame(width: 50, height: 50)
                            .cornerRadius(6)
                        Text("Сложный\nмаршрут")
                    }
                }
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    VStack(spacing: 0) {
                        Image(systemName: "globe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .frame(width: 50, height: 50)
                            .cornerRadius(6)
                        Text("Куда\nугодно")
                    }
                }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    VStack(spacing: 0) {
                        Image(systemName: "calendar.badge.clock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .background(Color.indigo)
                            .frame(width: 55, height: 55)
                            .cornerRadius(6)
                        Text("Выходные")
                    }
                }
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    VStack(spacing: 0) {
                        Image(systemName: "flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .frame(width: 50, height: 50)
                            .cornerRadius(6)
                        Text("Горящие\nбилеты")
                    }
                }
            }
            .padding()
            .background(Color.black.opacity(0.2))
            .cornerRadius(10)
        }
    }
}

struct WindowView_Previews: PreviewProvider {
    static var previews: some View {
        WindowView()
    }
}
