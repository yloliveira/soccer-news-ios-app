//
//  WebView.swift
//  SoccerNews
//
//  Created by Yan Oliveira on 08/11/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  let urlString: String
  
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    if let url = URL(string: urlString) {
      let request = URLRequest(url: url)
      uiView.load(request)
    }
  }
}
