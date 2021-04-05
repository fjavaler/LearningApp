//
//  Test.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/4/21.
//

import Foundation

struct Test: Decodable, Identifiable {
    
    //MARK: - VARIABLES
    var id: Int
    var image: String
    var time: String
    var description: String
    var questions: [Question]
}
