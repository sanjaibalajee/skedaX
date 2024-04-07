//
//
import SwiftUI
//
//print("Hello")
//
//
//struct Course: Identifiable, Codable {
//    var id: Int
//    var name: String
//    var shortForm: String
//    var facultyInitials: String
//}
//
struct TimetableEntry:  Codable {
    
    var courseId: Int
    var day: String
    var startTime: String
    var endTime: String
}


func readCourseInformation() -> [Course]? {
    if let path = Bundle.main.path(forResource: "course_information", ofType: "json", inDirectory: "Data") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            // Print raw JSON data for debugging
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON data: \(jsonString)")
            }
            
            let courses = try JSONDecoder().decode([Course].self, from: data)
            return courses
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
    return nil
}

// Example usage
if let courses = readCourseInformation() {
    for course in courses {
        print("ID: \(course.id), Name: \(course.name), Short Form: \(course.shortForm), Faculty Initials: \(course.facultyInitials)")
    }
} else {
    print("Failed to read course information from JSON.")
}


//let newCourses:[Course]=Bundle.main.decode("course_information.json")


//let timetableData:[TimetableEntry]=Bundle.main.decode("timetable.json")
//print(timetableData)



//import Swift
//
//struct timetable{
//    let timetableData:[TimetableEntry]=Bundle.main.decode("timetable.json")
//    
//    func print1(){
//        for timetables in timetableData{
//            print(timetables.day)
//        }
//    }
//}
//
//
//var timetable1=timetable()
//timetable1.print1()
