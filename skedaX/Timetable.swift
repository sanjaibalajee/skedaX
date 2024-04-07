//
//  Timetable.swift
//  skedaX
//
//  Created by Sanjai Balajee on 13/02/24.
//

import Foundation

struct Course: Codable, Identifiable {
    var id = UUID()
    var time: String
    var course: String
    var courseShortForm: String
    var facultyInitials: String
}

struct DaySchedule: Codable {
    var Monday: [Course]
    var Tuesday: [Course]
    var Wednesday: [Course]
    var Thursday: [Course]
    var Friday: [Course]
}

struct Timetable: Codable {
    var timetable: DaySchedule
}



