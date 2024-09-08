//
//  Course.swift
//  app-01
//
//  Created by Enrique Macias on 07/08/24.
//

import SwiftUI

struct Course: Identifiable {
    var id: UUID
    var title: String
    var courseID: String
    var days: String
    var classHours: String
    var color: Color
    var location: String
    
    init(id: UUID = UUID(), title: String, courseID: String, days: String, classHours: String, color: Color, location: String) {
        self.id = id
        self.title = title
        self.courseID = courseID
        self.days = days
        self.classHours = classHours
        self.color = color
        self.location = location
    }
}

