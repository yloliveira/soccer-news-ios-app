//
//  Team.swift
//  SoccerNews
//
//  Created by Yan Oliveira on 08/11/22.
//

struct Team: Identifiable {
  var id: String {
    return tag
  }
  let tag: String
  let name: String
}
