//
//  Item.swift
//  CreativeWriting
//
//  Created by Jana Gagacheva    on 12/11/23.
//

import Foundation
import SwiftData

@Model
final class Note: Identifiable {
    var id = UUID()
    var title: String
    var body: String
    var dateCreated: Date
    
    init(title: String, 
         body: String,
         dateCreated: Date = .now) {
        self.title = title
        self.body = body
        self.dateCreated = dateCreated
    }
}
