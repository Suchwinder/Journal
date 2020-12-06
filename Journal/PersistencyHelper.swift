//
//  PersistencyHelper.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/4/20.
//

import Foundation

// refer to Bullseye app, this wasn't explained in debt
class PersistencyHelper {
  
  // update our file with a new array of contents
  static func saveMoods(_ items: [MoodItem]) {
    let encoder = PropertyListEncoder()
    do {
      let data = try encoder.encode(items)
      try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
    } catch {
      print("Error encoding item array: \(error.localizedDescription)")
    }
  }
  
  // Need to load data from a file
  static func loadMoodItems() -> [MoodItem] {
    var items = [MoodItem]()
    let path = dataFilePath()
    if let data = try? Data(contentsOf: path) {
      let decoder = PropertyListDecoder()
      do {
        items = try decoder.decode([MoodItem].self, from: data)
      } catch {
        print("Error decoding item array: \(error.localizedDescription)")
      }
    }
    return items
  }
  
  // based on inference it seems to be creating some file to store the contents there
  // not too sure where it in the directory it is located
  static func dataFilePath() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory,
                                          in: .userDomainMask)
    return paths[0].appendingPathComponent("HighScores.plist")
  }
}
