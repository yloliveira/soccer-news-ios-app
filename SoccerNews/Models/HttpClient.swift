//
//  HttpClient.swift
//  SoccerNews
//
//  Created by Yan Oliveira on 07/11/22.
//

import Foundation

struct HttpClient {
  func performGetRequest(with urlString: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
    if let url = URL(string: urlString) {
      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      
      let session = URLSession(configuration: .default)
      let task = session.dataTask(with: request, completionHandler: completionHandler)
      
      task.resume()
    }
  }
}
