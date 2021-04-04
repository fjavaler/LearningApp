//
//  Module.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/4/21.
//

import Foundation

struct Module: Decodable, Identifiable {
  var id: Int
  var category: String
  var content: Content
  var test: Test
}
