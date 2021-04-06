//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Frederick Javalera on 4/4/21.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
  
  //MARK: - VARIABLES
  @EnvironmentObject var model: ContentModel
  
  //MARK: - BODY
  var body: some View {
    
    // Current lesson being displayed
    let lesson = model.currentLesson
    
    // Get media URL
    let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
    
    VStack {
      
      // Only show video if we get a valid URL
      if url != nil {
        VideoPlayer(player: AVPlayer(url: url!))
          .cornerRadius(10)
      }
      
      // Description
      CodeTextView()
        
      // Show next lesson button, only if there is a next lesson
      if model.hasNextLesson() {
        
        // Advance lesson button
        Button(action: {
          
          // Advance the lesson
          model.nextLesson()
        }, label: {
          ZStack {
            
            RectangleCard(color: Color.green)
                .frame(height: 48)
            
            Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
              .foregroundColor(.white)
              .bold()
          }
        })
      } else {
        // Show the complete button instead
        Button(action: {
          
          // Take the user back to the home view
            model.currentContentSelected = nil
        }, label: {
          ZStack {
            
            RectangleCard(color: Color.green)
                .frame(height: 48)
            
            Text("Complete")
              .foregroundColor(.white)
              .bold()
          }
        })
      }
    }
    .padding()
    .navigationBarTitle(lesson?.title ?? "")
  }
}

//MARK: - PREVIEW
struct ContentDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ContentDetailView()
  }
}
