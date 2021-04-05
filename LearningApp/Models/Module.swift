//
//  Module.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/4/21.
//

import Foundation

struct Module: Decodable, Identifiable {
    
    //MARK: - VARIABLES
    var id: Int
    var category: String
    var content: Content
    var test: Test
}
