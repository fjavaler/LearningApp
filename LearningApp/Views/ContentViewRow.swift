//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Frederick Javalera on 4/4/21.
//

import SwiftUI

struct ContentViewRow: View {
    
    //MARK: - VARIABLES
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    //MARK: - BODY
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        
        // Lesson Card
        ZStack (alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack (spacing: 30) {
                
                Text(String(index + 1))
                    .bold()
                
                VStack (alignment: .leading) {
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                }
            }
            .padding()
        }
        .padding(.bottom, 5)
    }
}

//MARK: - PREVIEW
struct ContentViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewRow(index: 1)
    }
}
