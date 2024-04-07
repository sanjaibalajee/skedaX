//
//  DateExtensions.swift
//  skedaX
//
//  Created by Sanjai Balajee on 13/02/24.
//

import Foundation

extension Date{
    func format(_ format:String) -> String{
        let formatter=DateFormatter()
        formatter.dateFormat=format
        return formatter.string(from:self)
    }
}
