//
//  MainView.swift
//  skedaX
//
//  Created by Sanjai Balajee on 13/02/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem { Image(systemName: "calendar")
                    Text("Class")
                }
            takeAttendanceView()
                .tabItem { Image(systemName: "checkmark.circle")
                    Text("Rep")
                }
        }
    }
}

#Preview {
    MainView()
}
