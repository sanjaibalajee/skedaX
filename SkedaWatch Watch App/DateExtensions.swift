//
//  DateExtensions.swift
//  Skeda
//
//  Created by Sanjai Balajee on 29/01/24.
//

import SwiftUI

extension Date{
    func format(_ format:String) -> String{
        let formatter=DateFormatter()
        formatter.dateFormat=format
        return formatter.string(from:self)
    }
    var isToday:Bool{
        return Calendar.current.isDateInToday(self)
    }
    
    static func updateHour(_ value:Int) -> Date{
        let calendar=Calendar.current
        return calendar.date(byAdding:.hour,value:value,to:.init()) ?? .init()
    }
    func fetchWeek(_ date:Date = .init()) -> [WeekDay]{
        let calendar=Calendar.current
        let startOfDate=calendar.startOfDay(for: date)
        
        var week:[WeekDay]=[]
        let weekForDate=calendar.dateInterval(of: .weekOfMonth, for: startOfDate)
        
        guard let starOfWeek=weekForDate?.start else {
            return []
        }
        (0..<7).forEach{
            item in
            if let weekDay=calendar.date(byAdding: .day, value:item,to: starOfWeek){
                week.append(.init(date: weekDay))
            }
        }
        return week
    }
    func createNextWeek() -> [WeekDay]{
        let calendar=Calendar.current
        let startOfLastDate=calendar.startOfDay(for: self)
        guard let nextDate = calendar.date(byAdding: .day, value:1, to: startOfLastDate) else{
        return []
        }
        return fetchWeek(nextDate)
    }
    
    func createPrevWeek() -> [WeekDay]{
        let calendar=Calendar.current
        let startOfFirstDate=calendar.startOfDay(for: self)
        guard let PrevDate = calendar.date(byAdding: .day, value:-1, to: startOfFirstDate) else{
        return []
        }
        return fetchWeek(PrevDate)
    }
    
    struct WeekDay:Identifiable{
        var id:UUID = .init()
        var date:Date
    }
}
