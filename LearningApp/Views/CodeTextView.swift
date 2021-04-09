//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Frederick Javalera on 4/5/21.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    //MARK: - VARIABLES
    @EnvironmentObject var model: ContentModel
    
    //MARK: - METHODS
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        
        // Set the attributed text for the lesson
        textView.attributedText = model.codeText
        
        // Scroll back to the top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
        
    }
}

//MARK: - PREVIEWS
struct CodeTextView_Previews: PreviewProvider {
    @StateObject static var model = ContentModel()
    static var previews: some View {
        CodeTextView()
            .environmentObject(model)
    }
}
