//
//  EditCourseListItem.swift
//  skedaX
//
//  Created by Sanjai Balajee on 18/02/24.
//

import SwiftUI


struct EditCourseListItem: View {
    var shortForm:String
    var courseName:String
    var startTime:String
    var endTime:String
    var hoursAttended:Int
    var totalHours:Int
    var color:Color
    
    
    var body: some View {
        VStack(spacing:2) {
            HStack(spacing:7) {
                
                ZStack{
                    Circle()
                        .frame(width: 50)
                        .padding()
                        .foregroundColor(color)
                    Text(shortForm)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        
                }

                
                VStack(alignment:.leading, spacing:8){
                    Text(courseName)
                        
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    HStack(spacing:10){
                        Text("\(hoursAttended)/\(totalHours)")
                        Text("\(String(format:"%0.0f",getPercentage()))%")
                            .foregroundColor(getPercentage()>75 ? .green : .red)
                            .fontWeight(.bold)
                        
                    }
                   
                    

                        
                        
                }
                .padding(.horizontal,5)

                

            }

            
          
        }
        
        
    }
    
    func getPercentage() -> Float{
        let percentage:Float=(Float(hoursAttended)/Float(totalHours))*100
        return Float(percentage)
    }
    

    
    
}
       
  
#Preview(traits: .sizeThatFitsLayout) {
    List{
        EditCourseListItem(shortForm: "IP", courseName: "internet Programming", startTime: "8:00am", endTime: "9:00am",hoursAttended: 1,totalHours: 2, color:Color.red)
        
    }
   
}

