//
//  TakeAttendanceView.swift
//  skedaX
//
//  Created by Sanjai Balajee on 13/02/24.
//

import SwiftUI

struct takeAttendanceView: View {
    let rollNumberRange = 64 ... 125
    let itemsPerRow = 7 // Adjust the number of items per row

    @State private var absentSet: Set<Int> = []
    @State private var copiedToClipboard: Bool = false

    var numberOfRows: Int {
        let totalRollNumbers = rollNumberRange.count
        return (totalRollNumbers + itemsPerRow - 1) / itemsPerRow
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Spacer()
                    Button(action: { absentSet.removeAll() }, label: { Text("Clear").fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/) })
                }
                .padding(.horizontal, 30)
                VStack {
                    ForEach(0 ..< numberOfRows, id: \.self) { row in
                        HStack(spacing: 15) { // Adjust the spacing as needed
                            ForEach(0 ..< itemsPerRow, id: \.self) { column in
                                let rollNumber = (row * itemsPerRow) + column + rollNumberRange.lowerBound
                                if rollNumber <= rollNumberRange.upperBound {
                                    Circle()
                                        .frame(width: 40, height: 60)
                                        .foregroundColor(self.absentSet.contains(rollNumber) ? .red : .accentColor)
                                        .overlay(
                                            Text("\(rollNumber)")
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                                .font(.system(size: 19))
                                        )
                                        .onTapGesture {
                                            self.toggleAttendance(rollNumber)
                                        }
                                } else {
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.gray) // Adjust color as needed
                                        .overlay(
                                            Text("X")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        )
                                }
                            }
                        }
                    }
                }
                .padding()
                Button(action: {
                    self.copyToClipboard()
                }, label: {
                    Text("Copy to Clipboard 🚀")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                })
                .buttonStyle(.bordered)
                .alert(isPresented: $copiedToClipboard) {
                    Alert(title: Text("Copied!"), message: Text("Attendance data copied to clipboard. 📋"), dismissButton: .default(Text("OK")))
                }
                .padding()
            }
            .navigationBarTitle("Attendence")
        }
    }

    func toggleAttendance(_ rollNumber: Int) {
        if absentSet.contains(rollNumber) {
            absentSet.remove(rollNumber)
        } else {
            absentSet.insert(rollNumber)
        }
        print(absentSet)
    }

    func copyToClipboard() {
        let attendanceString = absentSet.sorted().map { "\($0)" }.joined(separator: ", ")
        UIPasteboard.general.string = attendanceString
        copiedToClipboard = true
    }
}

struct takeAttendanceView_Previews: PreviewProvider {
    static var previews: some View {
        takeAttendanceView()
    }
}

