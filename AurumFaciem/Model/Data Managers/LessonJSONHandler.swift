//
//  LessonJSONHandler.swift
//  AurumFaciem
//
//  Created by Nathalia Melare on 09/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import UIKit

struct Lesson: Codable {
    var name: String
    var pending: Int
    var score: Int
    var videos: [String]
}

class LessonHandler: NSObject {
    static func getAllLessons() -> [Lesson] {
        var lesson: [Lesson] = []
        do {
            if let path = Bundle.main.path(forResource: "LessonJSON", ofType: "json", inDirectory: nil) {
                let url = URL(fileURLWithPath: path)
                let lessonData = try Data (contentsOf: url)
                lesson = try JSONDecoder().decode([Lesson].self, from: lessonData)
                return lesson
            }
        } catch {
            print("Erro Lesson")
        }
        return lesson
    }
}
