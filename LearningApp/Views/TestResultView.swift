//
//  TestResultView.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/9/21.
//

import SwiftUI

struct TestResultView: View {
    
    //MARK: - VARIABLES
    @EnvironmentObject var model: ContentModel
    var numCorrect: Int
    
    var resultHeading: String {
        
        guard model.currentModule != nil else {
            return ""
        }
        
        let pct = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        
        if pct > 0.5 {
            return "Awesome"
        } else if pct > 0.2 {
            return "Doing great!"
        } else {
            return "Keep learning."
        }
        
    }
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text(resultHeading)
                .font(.title)
            
            Spacer()
            
            Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions right")
            
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
            .padding(.horizontal)
        }
    }
}

//MARK: - PREVIEW
struct TestResultView_Previews: PreviewProvider {
    @StateObject static var model = ContentModel()
    static var previews: some View {
        TestResultView(numCorrect: 4)
            .environmentObject(model)
    }
}
