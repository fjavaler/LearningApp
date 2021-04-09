//
//  TestResultView.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/9/21.
//

import SwiftUI

struct TestResultView: View {
  
  @EnvironmentObject var model: ContentModel
  
    var body: some View {
      VStack {
        
        Spacer()
        
        Text("Doing great!")
          .font(.title)
        
        Spacer()
        
        Text("You got X out of X questions right")
        
        Spacer()
        
        Button(action: {
          
          // Send the user back the home view
          model.currentTestSelected = nil
        }, label: {
          ZStack {
            
            RectangleCard(color: .green)
              .frame(height: 48)
            
            Text("Complete")
              .bold()
              .foregroundColor(.white)
          }
        })
      }
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView()
    }
}
