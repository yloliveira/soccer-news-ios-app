//
//  ContentView.swift
//  SoccerNews
//
//  Created by Yan Oliveira on 07/11/22.
//

import SwiftUI

struct HomeView: View {
  @State var selectedTeam = "vasco"
  
  var body: some View {
    VStack {
      Picker("Selecione o seu time", selection: $selectedTeam) {
        Text("Botafogo").tag("botafogo")
        Text("Flamengo").tag("flamengo")
        Text("Fluminense").tag("fluminense")
        Text("Vasco da Gama").tag("vasco")
      }
      List(posts) {
        Text($0.title)
      }
    }
  }
}

let posts = [
  News(id: "1", title: "Subida no sufoco mostra que Vasco precisa de mais do que dinheiro", url: "link 1"),
  News(id: "2", title: "Com acesso e dinheiro, Vasco destrava planejamento e vai ao mercado: \"Nova era começa hoje\"", url: "link 2"),
  News(id: "3", title: "Vasco sobe com drama no lugar do protocolo", url: "link 3"),
]

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
