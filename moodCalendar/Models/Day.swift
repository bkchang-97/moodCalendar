//
//  Day.swift
//  moodCalendar
//
//  Created by Benjamin Chang on 2021-05-02.
//

import Foundation
import SwiftUI

class Day: Codable {
    var day: String
    var color: Int
    var weekday: Int
    
}

class Days: ObservableObject {
    @Published var days: [Day]
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
            if let decoded = try? JSONDecoder().decode([Day].self, from: data) {
                self.days = decoded
                return
            }
        }

        self.days = load("BlankData.json")
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(days) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
}
