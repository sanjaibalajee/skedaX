//
//  TimetableModel.swift
//  skedaX
//
//  Created by Sanjai Balajee on 13/02/24.
//



import SwiftUI
import Foundation
import SwiftData

struct Course: Identifiable, Codable {
    var id: Int
    var name: String
    var shortForm: String
    var facultyInitials: String
}

struct TimetableEntry:  Codable {
    
    var courseId: Int
    var day: String
    var startTime: String
    var endTime: String
}


@Model

class CourseTrackInfo{
    var courseId:Int
    var totalHoursAttended:Int
    var totalHours:Int
    
    init(courseId: Int, totalHoursAttended: Int, totalHours: Int) {
        self.courseId = courseId
        self.totalHoursAttended = totalHoursAttended
        self.totalHours = totalHours
    }
    
}




