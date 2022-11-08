//
//  ContentView.swift
//  SoccerNews
//
//  Created by Yan Oliveira on 07/11/22.
//

import SwiftUI

struct HomeView: View {
  let teams = [
    Team(tag: "vasco", name: "Vasco da Gama"),
    Team(tag: "botafogo", name: "Botafogo"),
    Team(tag: "flamengo", name: "Flamengo"),
    Team(tag: "fluminense", name: "Fluminense"),
  ]
  
  @State var selectedTeam = "vasco"
  @ObservedObject var newsManager = NewsManager()
  
  var body: some View {
    NavigationView {
      VStack {
        Picker("Selecione o seu time", selection: $selectedTeam) {
          ForEach(teams) { team in
            Text(team.name)
          }
        }
        .onChange(of: selectedTeam, perform: self.onChangePickerValue)
        List(newsManager.news) { item in
          NavigationLink(destination: DetailView(url: item.url)) {
            Text(item.title)
              .lineLimit(2)
              .truncationMode(.tail)
          }
        }
        .navigationBarTitle("SOCCER NEWS")
        .listStyle(PlainListStyle())
      }
      .padding(.vertical)
    }.onAppear(perform: fetchNewsData)
  }
  
  private func onChangePickerValue(newValue: String) {
    self.fetchNewsData()
  }
  
  private func fetchNewsData() {
    self.newsManager.fetchNewsData(with: self.selectedTeam)
  }
}


//MARK: - HomeView_Previews

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
