//
//  ContentModel.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/4/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    //MARK: - VARIABLES
    // List of models
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    // Current lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    var styleData: Data?
    
    //MARK: - INITIALIZER
    init() {
        getLocalData()
    }
    
    // MARK: - Data Methods
    func getLocalData() {
        
        // Parse the data.json file
        // Get a URL to the JSON file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the JSON into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to class' modules property
            self.modules = modules
        } catch {
            // Log error
            fatalError("\(error)")
        }
        
        // Parse the style.html data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            // Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            // Assign parsed data to class' styleData property
            self.styleData = styleData
        } catch {
            fatalError("\(error)")
        }
    }
    
    // MARK: - Module Navigation Methods
    func beginModule(_ moduleId: Int) {
        
        // Find the index for this module id
        for index in 0..<modules.count {
            
            if modules[index].id == moduleId {
                
                // Found the matching module
                currentModuleIndex = index
                break
            }
            
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex: Int) {
        // Check that the lesson index is within range of module lessons
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        } else {
            currentLessonIndex = 0
        }
        
        // Set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
    func nextLesson() {
        // Advance the lesson
        currentLessonIndex += 1
        
        // Check that it is within range
        if currentLessonIndex < currentModule!.content.lessons.count {
            
            // Set the current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        } else {
            
            // Reset the lesson state
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    func hasNextLesson() -> Bool {
        return currentLessonIndex + 1 < currentModule!.content.lessons.count ? true : false
    }
}
