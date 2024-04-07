//
//  ViewExtensions.swift
//  Skeda
//
//  Created by Sanjai Balajee on 29/01/24.
//

import SwiftUI

extension View{
    @ViewBuilder
    func hspacing(_ alignment:Alignment) -> some View{
        self.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: alignment)
    }
    @ViewBuilder
    func vspacing(_ alignment:Alignment) -> some View{
        self.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: alignment)
    }
    
    func isSameDate(_ date:Date, _ date2: Date) -> Bool{
        return Calendar.current.isDate(date,inSameDayAs: date2)
    }
}
