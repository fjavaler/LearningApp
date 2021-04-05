//
//  Lesson.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/4/21.
//

import Foundation

struct Lesson: Decodable, Identifiable {
    
    //MARK: - VARIABLES
    var id: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
}
