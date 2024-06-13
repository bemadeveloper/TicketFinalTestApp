//
//  ArticleViewModel.swift
//  TicketFinalTestApp
//
//  Created by Bema on 13/6/24.
//

import Foundation

class ArticleViewModel: ObservableObject{
    @Published var articles: [Article] = []
    func fetchArticle(){
        
        guard let url = Bundle.main.url(forResource: "Articles", withExtension: "json") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _,
            error in
            guard let data = data, error == nil else{
                return
            }

            do {
                let articles = try JSONDecoder().decode([Article].self, from: data)
                DispatchQueue.main.async {
                    self?.articles = articles
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}
