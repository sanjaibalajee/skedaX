//
//  CodableExtension.swift
//  SkedaGlanceExtension
//
//  Created by Sanjai Balajee on 18/02/24.
//

import Foundation


extension Bundle{
    func decode<T:Codable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil ) else{
            fatalError("Wrong URL")
        }
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Contents corrupted")
        }
        
        let decoder=JSONDecoder()
        
        guard let decodedData=try? decoder.decode(T.self, from: data) else {
            fatalError("Unable to decode")
        }
        return decodedData
    }
}

extension Date{
    func format(_ format:String) -> String{
        let formatter=DateFormatter()
        formatter.dateFormat=format
        return formatter.string(from:self)
    }
}
