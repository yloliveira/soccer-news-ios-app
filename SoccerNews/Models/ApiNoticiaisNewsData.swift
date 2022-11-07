//
//  ApiNoticiaisPostData.swift
//  SoccerNews
//
//  Created by Yan Oliveira on 07/11/22.
//

struct ApiNoticiaisNewsData: Decodable {
  let list: [ApiNoticiaisNewsDataItem]
}

struct ApiNoticiaisNewsDataItem: Decodable {
  let title: String
  let link: String
}
