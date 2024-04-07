//
//  OffsetKey.swift
//  Skeda
//
//  Created by Sanjai Balajee on 30/01/24.
//

import SwiftUI


struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat=0
    
    
    static func reduce(value: inout CGFloat,nextValue:() -> CGFloat){
        value=nextValue()
    }
}
