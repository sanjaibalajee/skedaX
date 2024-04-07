
import SwiftUI
import SwiftData
struct showAllCoursesView: View {
    let allCourses: [Course] = Bundle.main.decode("course_information.json")
    @Environment(\.modelContext) var modelContext
    @Query var attendancedetails: [CourseTrackInfo]

    let colors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .yellow, .teal, .indigo]
    @State private var counter:Bool=false

    var body: some View {
        NavigationStack {
            List(1..<10, id: \.self) { courseId in
                if let course = getCourseById(courseId) {
                    if let attendanceInfo = attendancedetails.first(where: { $0.courseId == courseId }) {
                        NavigationLink(value:attendanceInfo){
                            EditCourseListItem(
                                shortForm: course.shortForm,
                                courseName: course.name,
                                startTime: "",
                                endTime: "",
                                hoursAttended: attendanceInfo.totalHoursAttended,
                                totalHours: attendanceInfo.totalHours,
                                color: colors[courseId % colors.count] // Use array of colors
                            )
                        }
                        .navigationDestination(for: CourseTrackInfo.self, destination: editAttendenceDataView.init)
                        
                    } else {
                        EditCourseListItem(
                            shortForm: course.shortForm,
                            courseName: course.name,
                            startTime: "",
                            endTime: "",
                            hoursAttended: 0,
                            totalHours: 0,
                            color: colors[courseId % colors.count] // Use array of colors
                        )
                    }
                }
            }
            .navigationTitle("All Courses 📚")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button(action:{initialiseAttendenceDetails(attendancedetails: attendancedetails)},label:{Text("Initialse")})
                    .sensoryFeedback(.impact(weight: .heavy, intensity: 2), trigger: counter)
            }
        }
    }

    func getCourseById(_ courseId: Int) -> Course? {
        return allCourses.first { $0.id == courseId }
    }
    func initialiseAttendenceDetails(attendancedetails:[CourseTrackInfo]){
        counter.toggle()
        print(attendancedetails.count)
        if attendancedetails.count==0{
            for courseId in 0..<10{
                let courseObject = CourseTrackInfo(courseId: courseId, totalHoursAttended: 0, totalHours: 0)
                      
                    modelContext.insert(courseObject)
            }
        }
        for index in attendancedetails.indices {
            
                attendancedetails[index].totalHours = 0
            attendancedetails[index].totalHoursAttended = 0
            
            }
    }

}

// Preview
struct showAllCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        showAllCoursesView()
    }
}

