//
//  CourseItemWatchView.swift
//  SkedaWatch Watch App
//
//  Created by Sanjai Balajee on 19/02/24.
//

import SwiftUI

struct CourseItemWatchView: View {
    var CourseShortForm: String
    var CourseName: String
    var color: Color
    var body: some View {
        HStack(spacing: 2) {
            ZStack {
                Circle()
                    .foregroundColor(color)
                    .frame(width:40,height: 30)
                Text(CourseShortForm)
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    
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

#Preview {
    List{
        CourseItemWatchView(CourseShortForm: "IP", CourseName: "Machine Leaning Lab", color: .blue)
    }
    
}
