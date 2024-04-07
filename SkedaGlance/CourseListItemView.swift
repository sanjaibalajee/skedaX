//
//  CourseListItemView.swift
//  SkedaGlanceExtension
//
//  Created by Sanjai Balajee on 18/02/24.
//

import SwiftUI

struct CourseListItemView: View {
    var body: some View {
        HStack(spacing:2){
            ZStack{
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 20)
                Text("IP")
                    .foregroundColor(.black)
                    .font(.system(size: 9))
                    .fontWeight(.heavy)
                    
                    
            }
            .padding(.horizontal,10)
            Text("Internet Programming").font(.system(size: 10))
            
        }
    }
}
//
//#Preview {
//    CourseListItemView()
//}
//
