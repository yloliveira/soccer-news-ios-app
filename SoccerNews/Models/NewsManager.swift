//
//  NewsManager.swift
//  SoccerNews
//
//  Created by Yan Oliveira on 07/11/22.
//

import Foundation

class NewsManager: ObservableObject {
  private let httpClient = HttpClient()
  private let apiUrl = "https://apinoticias.tedk.com.br/api"
  
  @Published var news = [News]()
  
  func fetchNewsData(with term: String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    let currentDate = dateFormatter.string(from: Date.now)
    let url = "\(apiUrl)?q=\(term)&date=\(currentDate)"
    
    httpClient.performGetRequest(with: url) { data, response, error in
      if let e = error {
        print(e.localizedDescription)
      }
      
      if let safeData = data {
        if let news = self.parseJSON(safeData) {
          DispatchQueue.main.async {
            self.news = news
          }
        }
      }
    }
  }
  
  private func parseJSON(_ data: Data) -> [News]? {
    let decoder = JSONDecoder()
    do {
      let decodedData = try decoder.decode(ApiNoticiaisNewsData.self, from: data)
      let result = decodedData.list.map { item -> News in
        return News(id: item.link, title: item.title, url: item.link)
      }
      return result
    } catch {
      print(error.localizedDescription)
      return nil
    }
  }
}
