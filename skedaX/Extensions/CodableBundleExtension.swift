//
//  CodableBundleExtension.swift
//  skedaX
//
//  Created by Sanjai Balajee on 13/02/24.
//

import Foundation





extension Bundle{
    func decode<T:Codable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil,subdirectory: "Data" ) else{
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
