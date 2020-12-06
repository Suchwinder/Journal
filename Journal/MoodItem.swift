//
//  MoodItem.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/4/20.
//

import Foundation

// structure to store our moods in
// https://www.swiftbysundell.com/basics/codable/#:~:text=Introduced%20in%20Swift%204%2C%20the,a%20serialized%20format%2C%20like%20JSON.&text=In%20the%20above%20example%2C%20we,any%20error%20that%20was%20encountered.
// Codable allows us to basically encode and decode into a format
// the textbook says its needed to write to a file
class MoodItem : Codable {
    var date = ""
    var mood = ""
}
