//
//  ContentModel.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/4/21.
//

import Foundation

class ContentModel: ObservableObject {
  @Published var modules = [Module]()
  var styleData: Data?
  
  init() {
    getLocalData()
  }
  
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
      // TODO log error
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
}
