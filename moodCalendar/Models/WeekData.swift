//
//  WeekData.swift
//  moodCalendar
//
//  Created by Benjamin Chang on 2021-05-04.
//

import Foundation
import SwiftUI


var days: [Day] = load("colorlist.json")

//func writeJSON(_ entry: [Day]) {
//
//    do {
//        let fileURL = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//            .appendingPathComponent("colorlist.json")
//
//        let encoder = JSONEncoder()
//        try encoder.encode(entry).write(to: fileURL)
//    } catch {
//        print(error.localizedDescription)
//    }
//}
func save (data: [Day]) {
    let jsonString: String
    do {
        let jsonData = try JSONEncoder().encode(days)
        jsonString = String(data: jsonData, encoding: .utf8)!
        print(jsonString)
//        try jsonString.write(toFile: "data.json", atomically: true, encoding: .utf8)
//        let docDirURL = try! FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: true)
//        let fileURL = docDirURL.appendingPathComponent(filename)
//
//        try! jsonString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                            in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent("colorlist.json")
            do {
                try jsonString.write(to: pathWithFilename,
                                     atomically: true,
                                     encoding: .utf8)
            } catch {
                print(error)
            }
        }
    } catch {
        print(error)
    }
}

func load <T: Decodable> (_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
