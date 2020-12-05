//
//  PersistencyHelper.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/4/20.
//

import Foundation

class PersistencyHelper {
  
  static func saveMoods(_ items: [MoodItem]) {
    let encoder = PropertyListEncoder()
    do {
      let data = try encoder.encode(items)
      try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
    } catch {
      print("Error encoding item array: \(error.localizedDescription)")
    }
  }
  
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
  
  static func dataFilePath() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory,
                                          in: .userDomainMask)
    return paths[0].appendingPathComponent("HighScores.plist")
  }
}
