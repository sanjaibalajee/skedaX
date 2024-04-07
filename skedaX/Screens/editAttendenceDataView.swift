//
//  editAttendenceDataView.swift
//  skedaX
//
//  Created by Sanjai Balajee on 16/02/24.
//

import SwiftUI
import SwiftData
struct editAttendenceDataView: View {
    @Bindable var attendencedetails:CourseTrackInfo
    var body: some View {
        Text("Edit Attendence Info")
        Form{
            Section("Edit Course Info"){
                Picker("Total Hours Attended",selection:$attendencedetails.totalHoursAttended){
                    ForEach(0..<50){
                        Text("\($0)")
                    }
                }
                
                

                
                Picker("Total Hours",selection:$attendencedetails.totalHours){
                    ForEach(0..<50){
                        Text("\($0)")
                    }
                }
            }
            
        }
    }
}

#Preview {
    do{
        let config=ModelConfiguration(isStoredInMemoryOnly: true)
        let container=try ModelContainer(for:CourseTrackInfo.self, configurations: config)
        let example=CourseTrackInfo(courseId: 1, totalHoursAttended: 1, totalHours: 1)
        return editAttendenceDataView(attendencedetails: example)
            .modelContainer(container)
            
    }
    catch{
        fatalError("Error Happened")
    }
    
}
