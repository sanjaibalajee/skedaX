//
//  SkedaGlance.swift
//  SkedaGlance
//
//  Created by Sanjai Balajee on 18/02/24.
//

import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct SkedaGlanceEntryView: View {
    var entry: Provider.Entry
    let colors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .yellow, .teal, .indigo]
    @State private var currentDate: Date = .init()
    let timetableData: [TimetableEntry] = Bundle.main.decode("timetable1.json")
    let allCourses: [Course] = Bundle.main.decode("course_information.json")

    var body: some View {
        VStack {
            Text("Today")
                .font(.system(size: 9))
                .foregroundStyle(.accent)
                .padding(.top,7)
            if(getTodayTimetableEntries().count==0){
                Text("You are free! Enjoy! 🥰")
                    .multilineTextAlignment(.center)
            }
            ForEach(getTodayTimetableEntries(), id: \.courseId) { item in
            
                if let course = getCourseById(item.courseId) {
                    CourseItemWidgetListView(CourseShortForm: course.shortForm, CourseName: course.name, color: colors[item.courseId % colors.count])
                    Divider()
                }
            }
        }
        .padding(.horizontal,4)
        .padding(.vertical,10)
    }

    func getTodayTimetableEntries() -> [TimetableEntry] {
        let currentDay = currentDate.format("EEEE")
        return timetableData.filter { $0.day == currentDay }
    }

    func getCourseById(_ courseId: Int) -> Course? {
        return allCourses.first { $0.id == courseId }
    }
}

struct SkedaGlance: Widget {
    let kind: String = "SkedaGlance"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                SkedaGlanceEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                SkedaGlanceEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .contentMarginsDisabled()
        .configurationDisplayName("Skeda Glance")
        .description("Know what all classes you have today at a glance")
    }
}

#Preview(as: .systemSmall) {
    SkedaGlance()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}

struct CourseItemWidgetListView: View {
    var CourseShortForm: String
    var CourseName: String
    var color: Color
    var body: some View {
        HStack(spacing: 2) {
            ZStack {
                Circle()
                    .foregroundColor(color)
                    .frame(width:40,height: 13)
                Text(CourseShortForm)
                    .foregroundColor(.black)
                    .font(.system(size: 5))
                    .fontWeight(.heavy)
            }

            VStack(alignment:.leading){
                Text(CourseName)
                    .font(.system(size: 11))
                    .lineLimit(1)
            }
            Spacer()
        }
    


    }
}
