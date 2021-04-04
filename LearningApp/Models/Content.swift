//
//  Content.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/4/21.
//

import Foundation

struct Content: Decodable, Identifiable {
  var id: Int
  var image: String
  var time: String
  var description: String
  var lessons: [Lesson]
}
