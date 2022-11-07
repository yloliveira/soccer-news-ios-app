//
//  ContentView.swift
//  SoccerNews
//
//  Created by Yan Oliveira on 07/11/22.
//

import SwiftUI

struct HomeView: View {
  @State var selectedTeam = "vasco"
  
  @ObservedObject var newsManager = NewsManager()
  
  var body: some View {
    NavigationView {
      VStack {
        Picker("Selecione o seu time", selection: $selectedTeam) {
          Text("Botafogo").tag("botafogo")
          Text("Flamengo").tag("flamengo")
          Text("Fluminense").tag("fluminense")
          Text("Vasco da Gama").tag("vasco")
        }
        .onChange(of: selectedTeam, perform: self.onChangePickerValue)
        List(newsManager.news) {
          Text($0.title)
        }
        .navigationBarTitle("SOCCER NEWS")
      }
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
