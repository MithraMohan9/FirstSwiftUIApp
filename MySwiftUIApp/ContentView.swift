//
//  ContentView.swift
//  ImpetusOn
//
//  Created by Mithra on 22/05/23.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 0
    var body: some View {
        

        TabView(selection: $selection) {
//            Text("Home Tab")
            CategoryVC()
//                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
         
//            Text("History Tab")
            GridVC()
//                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("History")
                }
                .tag(1)
            DemoView()
//            Text("Video Tab")
//                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Demo")
                }
                .tag(2)
         
            ThingsListView()
//            Text("Profile Tab")
//                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(3)
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
