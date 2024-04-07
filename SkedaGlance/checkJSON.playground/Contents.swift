import UIKit

var greeting = "Hello, playground"

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




struct TimetableEntry:  Codable {
    
    var courseId: Int
    var day: String
    var startTime: String
    var endTime: String
}




print("hello")

print("jfw")


let timetableData:[TimetableEntry] = Bundle.main.decode("timetable1.json")

print(timetableData.count)
