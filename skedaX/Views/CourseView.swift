//
//  CourseView.swift
//  skedaX
//
//  Created by Sanjai Balajee on 13/02/24.
//

import SwiftUI
import SwiftData

struct CourseView: View {
    var shortForm:String
    var courseName:String
    var startTime:String
    var endTime:String
    var hoursAttended:Int
    var totalHours:Int
    var color:Color
    @Bindable var attendencedetails:CourseTrackInfo
    @State private var counter = 0
    
    
    var body: some View {
        VStack(spacing:2) {
            HStack(spacing:7) {
                ZStack {
                    Circle()
                        .frame(width:50,height: 80)
                        .foregroundColor(color)
                        
                        
                    Text(shortForm)
                        .foregroundColor(.black)
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal,10)
                
                VStack(alignment:.leading, spacing:8){
                    Text(courseName)
                        .font(.title3)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Text("\(startTime)-\(endTime)")
                        .font(.caption)
                        .fontWeight(.medium)
                        
                        
                }
                .padding(.horizontal,5)
                HStack(spacing:14) {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .foregroundColor(.red)
                        .onTapGesture {
                            counter-=1
                            decreaseAttendance()
                            
                        }
                        .hapticFeedbackOnTap(style: .rigid)
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .foregroundColor(.green)
                        .onTapGesture {
                            counter+=1
                            increaseAttendance()
                            
                        }
                        .sensoryFeedback(.increase, trigger: counter)
                        
                }
                
                
               
            }

            
           Rectangle()
                .frame(height:2)
                .foregroundColor(.gray)
                .padding(.horizontal,10)
                .padding(.vertical,4)
                
            HStack(spacing:9){
                Text("\(hoursAttended)/\(totalHours)")
//                    .font(.title2)
                Spacer()
                Divider()
                    .frame(height: 50)
                Text("\(String(format:"%0.0f",getPercentage()))%")
                    
                    .foregroundColor(getPercentage()>75 ? .green : .red)
                
                Spacer()
                Divider()
                    .frame(height: 50)
                
                
                Text(returnDesc())
                    .foregroundColor(getPercentage()>75 ? .green : .red)
                
                
            }
            .padding(.horizontal,5)
            .padding(.vertical,6)
                
        }
        
        
    }
    
    func getPercentage() -> Float{
        let percentage:Float=(Float(hoursAttended)/Float(totalHours))*100
        return Float(percentage)
    }
    
    func returnDesc() -> String{
        return getPercentage()>75 ? "You can miss a class " : "Dont miss a class"
    }
    func increaseAttendance(){
        attendencedetails.totalHoursAttended+=1
        attendencedetails.totalHours+=1
        
    }
    func decreaseAttendance(){
        
        attendencedetails.totalHours+=1
    }
    
}
       
  
#Preview(traits: .sizeThatFitsLayout) {

    
    
    do{
        let config=ModelConfiguration(isStoredInMemoryOnly: true)
        let container=try ModelContainer(for:CourseTrackInfo.self, configurations: config)
        let example=CourseTrackInfo(courseId: 1, totalHoursAttended: 1, totalHours: 1)
        return  List{
            CourseView(shortForm: "IP", courseName: "internet Programming", startTime: "8:00am", endTime: "9:00am",hoursAttended: 0,totalHours: 0, color:.blue,attendencedetails: example)
                .modelContainer(container)
        }
    }
    catch{
        fatalError("Error Happened")
    }
    
   
}
