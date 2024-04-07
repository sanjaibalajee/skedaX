//
//  ContentView.swift
//  SkedaWatch Watch App
//
//  Created by Sanjai Balajee on 19/02/24.
//

import SwiftUI

struct ContentView: View {
    private let weekDays:[String]=["M","T","W","Th","F"]
    @State private var currentDate = Date()
    @State private var selectedDay: String?
    private let fullDayNames = Calendar.current.weekdaySymbols
    let colors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .yellow, .teal, .indigo]

    let timetableData: [TimetableEntry] = Bundle.main.decode("timetable1.json")
        let allCourses: [Course] = Bundle.main.decode("course_information.json")
    @State private var choice=false
    @State private var chosenDay=""
    var body: some View {
       
        
        VStack(spacing:8) {
            Text("Skeda")
                .foregroundColor(.accent)
            
            HStack(spacing:8){
                ForEach(weekDays,id: \.self){
                    day in
                    VStack(spacing:8){
                        Text(day)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .textScale(.secondary)
                            .foregroundColor(.black)
                            .frame(width:25,height: 25)
                            .background(content:{
                                Circle().fill(selectedDay == day  ? Color.green : (isToday(day) ? Color.accent : Color.gray))
                                
                            })
                            .onTapGesture {
                                selectedDay=day
                                choice=true
                                chosenDay=printFullDayName(for: day)
                                
                            }
                        
                    }
                }
            }
            Spacer()
            List{
                ForEach(getTodayTimetableEntries(choice:choice,selectedDay: chosenDay ), id: \.courseId) { item in
                    
                        if let course = getCourseById(item.courseId) {
                            CourseItemWatchView(CourseShortForm: course.shortForm, CourseName: course.name, color: colors[item.courseId % colors.count])
                            
                        }
                    }
                if getTodayTimetableEntries(choice:choice,selectedDay: chosenDay ).count==0{
                    Text("You are free Today! Enjoy 🥰")
                }
            }
        }
        .onAppear(){
            currentDate = Date()
            
        }
        .ignoresSafeArea()
        
        
    }
    private func isToday(_ day: String) -> Bool {
        let todayIndex = (Calendar.current.component(.weekday, from: currentDate) + 5) % 7 // Adjust to start from 0 for Sunday
        let weekDaysIndex = weekDays.firstIndex(of: day) ?? 0
        return todayIndex == weekDaysIndex
    }
    
    private func printFullDayName(for day: String) -> String{
        guard let dayIndex = weekDays.firstIndex(of: day) else { return ""}
        let fullDayName = fullDayNames[dayIndex+1]
        print("Selected day: \(fullDayName)")
        return fullDayName
    }
    
    func getTodayTimetableEntries(choice:Bool, selectedDay:String) -> [TimetableEntry] {
        if !choice{
            let currentDay = currentDate.format("EEEE")
            return timetableData.filter { $0.day == currentDay }
            
        }else{
            
            return timetableData.filter { $0.day == selectedDay }
        }
        
        
    }

    func getCourseById(_ courseId: Int) -> Course? {
        return allCourses.first { $0.id == courseId }
    }

}

#Preview {
    ContentView()
        .previewDevice("Apple Watch Series 9 (45mm)")
    
        
        
}
