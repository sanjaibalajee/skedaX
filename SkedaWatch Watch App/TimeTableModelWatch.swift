//
//  TimeTableModelWidget.swift
//  SkedaGlanceExtension
//
//  Created by Sanjai Balajee on 18/02/24.
//

import Foundation
import SwiftUI


struct TimetableEntry:  Codable {
    
    var courseId: Int
    var day: String
    var startTime: String
    var endTime: String
}
struct Course: Identifiable, Codable {
    var id: Int
    var name: String
    var shortForm: String
    var facultyInitials: String
}






