//
//  ContentView.swift
//  skedaX
//
//  Created by Sanjai Balajee on 13/02/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let allCourses: [Course] = Bundle.main.decode("course_information.json")
    let timetableData: [TimetableEntry] = Bundle.main.decode("timetable.json")
    @State private var currentDate: Date = .init()
    @Environment(\.modelContext)  var modelContext
    @Query var attendencedetails:[CourseTrackInfo]
    @State var isSheetShowing:Bool=false
    let colors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .yellow, .teal, .indigo]


    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack(spacing: 5) {
                        Text(currentDate.format("MMMM"))
                            .foregroundColor(.accentColor)
                        Text(currentDate.format("YYYY"))
                    }
                    .font(.title.bold())

                    Text(currentDate.formatted(date: .complete, time: .omitted))
                        .font(.callout)
                        .fontWeight(.semibold)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                }
                

                List(getTodayTimetableEntries(), id: \.courseId) { entry in
                    if let course = getCourseById(entry.courseId) {
                        if let attendanceInfo = attendencedetails.first(where: { $0.courseId == entry.courseId }) {
                            CourseView(
                                shortForm: course.shortForm,
                                courseName: course.name,
                                startTime: entry.startTime,
                                endTime: entry.endTime,
                                hoursAttended: attendanceInfo.totalHoursAttended,
                                totalHours: attendanceInfo.totalHours,
                                color: colors[entry.courseId % colors.count], attendencedetails: attendanceInfo
                            )
                        } else {
                            // If there's no attendance information for the course, use default values
                           
//                            CourseView(
//                                shortForm: course.shortForm,
//                                courseName: course.name,
//                                startTime: entry.startTime,
//                                endTime: entry.endTime,
//                                hoursAttended: 0,
//                                totalHours: 0,
//                                color: colors[entry.courseId % colors.count], attendencedetails:  CourseTrackInfo(courseId: 1, totalHoursAttended: 0, totalHours: 0)
//                            )
                        }
                    }
                }
.navigationTitle("Timetable  📅")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        
                   
                        
                        
                        Button(action:{isSheetShowing.toggle()}, label:{Image(systemName: "pencil.circle")})
                            .sensoryFeedback(.increase, trigger: isSheetShowing)
                    }
                    .sheet(isPresented:$isSheetShowing,content:{showAllCoursesView().edgesIgnoringSafeArea(.all)})
            }
        }
    }

    func currentDay(currentDate:Date) -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let formattedDay = dateFormatter.string(from: currentDate)
        if (formattedDay=="Sunday"){
            return "Monday"
        }
        return formattedDay
    }

    func getTodayTimetableEntries() -> [TimetableEntry] {
        var currentDay = currentDate.format("EEEE")
        currentDay=currentDay=="Sunday" ? "Monday" : currentDay
        return timetableData.filter { $0.day == currentDay }
    }

    func getCourseById(_ courseId: Int) -> Course? {
        return allCourses.first { $0.id == courseId }
    }
    
    
    func initialiseAttendenceDetails(){
        for courseId in 0..<10{
            let courseObject = CourseTrackInfo(courseId: courseId, totalHoursAttended: 0, totalHours: 0)
                  
                modelContext.insert(courseObject)
        }
    }
}

#Preview {
    ContentView()
}
