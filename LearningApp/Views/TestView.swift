//
//  TestView.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/6/21.
//

import SwiftUI

struct TestView: View {
  
  @EnvironmentObject var model: ContentModel
  
  var body: some View {
    
    if model.currentQuestion != nil {
      
      VStack {
        
        // Question number
        Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
        
        // Question
        CodeTextView()
        
        // Answers
        
        // Button
      }
      .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
    }
  }
}

struct TestView_Previews: PreviewProvider {
  static var previews: some View {
    TestView()
  }
}
