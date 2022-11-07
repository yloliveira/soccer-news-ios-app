//
//  ContentView.swift
//  SoccerNews
//
//  Created by Yan Oliveira on 07/11/22.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    List(posts) {
      Text($0.title)
    }
  }
}

let posts = [
  Post(id: "1", title: "Subida no sufoco mostra que Vasco precisa de mais do que dinheiro", url: "link 1"),
  Post(id: "2", title: "Com acesso e dinheiro, Vasco destrava planejamento e vai ao mercado: \"Nova era começa hoje\"", url: "link 2"),
  Post(id: "3", title: "Vasco sobe com drama no lugar do protocolo", url: "link 3"),
]

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
