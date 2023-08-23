//
//  ContentView.swift
//  CROM
//
//  Created by Allan Hull on 6/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {

            EventContentView()
             .tag(0)
            .tabItem {
                VStack {
                    Image("Event")
                    Text("Events")
                    }
                }

            StoreContentView()
                .tag(1)
                .tabItem {
                    VStack {
                        Image("Store")
                        Text("Stores")
                    }
                }
            
            TrailContentView()
            .tag(2)
                .tabItem {
                    VStack {
                        Image("Trail")
                        Text("Trails")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
