//
//  ContentView.swift
//  LearningApp
//
//  Created by Frederick Javalera on 4/4/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - VARIABLES
    @EnvironmentObject var model: ContentModel
    
    //MARK: - BODY
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                // Confirm that current module is set
                if model.currentModule != nil {
                
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                        NavigationLink(
                            destination: ContentDetailView()
                                .onAppear(perform: {
                                    model.beginLesson(index)
                                }),
                            label: {
                                ContentViewRow(index: index)
                            })
                    }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
