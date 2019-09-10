//
//  VideoJSONHandler.swift
//  AurumFaciem
//
//  Created by Nathalia Melare on 09/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import UIKit

struct Video: Codable {
    var category: String?
    var path: URL?
    var word: String?
    var isPartOf: String?
}

class VideoHandler: NSObject {
    static func getAllVideo() -> [Video] {
        var video: [Video] = []
        do {
            if let path = Bundle.main.path(forResource: "VideoJSON", ofType: ".json", inDirectory: nil) {
                let url = URL(fileURLWithPath: path)
                let videoData = try Data (contentsOf: url)
                video = try JSONDecoder().decode([Video].self, from: videoData)
                return video
            }
        } catch {
            print("Erro")
        }
        return video
    }
}
