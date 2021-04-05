//
//  Question.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/4/21.
//

import Foundation

struct Question: Decodable, Identifiable {
    
    //MARK: - VARIABLES
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
}
