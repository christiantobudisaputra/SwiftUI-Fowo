//
//  FowoApp.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import SwiftUI

@main
struct FowoApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    }

                Text("Subfomo")
                    .tabItem {
                        VStack {
                            Image(systemName: "bubble.left.and.bubble.right")
                            Text("Subfomo")
                        }
                    }

                Text("Company")
                    .tabItem {
                        VStack {
                            Image(systemName: "building.2")
                            Text("Company")
                        }
                    }

                Text("Notifikasi")
                    .tabItem {
                        VStack {
                            Image(systemName: "bell")
                            Text("Notifikasi")
                        }
                    }

                Text("Profil")
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Profil")
                        }
                    }
            }
        }
    }
}
