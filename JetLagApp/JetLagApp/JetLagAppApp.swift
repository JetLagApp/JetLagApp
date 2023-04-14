//
//  JetLagAppApp.swift
//  JetLagApp
//
//  Created by kwon ji won on 2023/01/15.
//

import SwiftUI

@main
struct JetLagAppApp: App {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color(hex: 0x2C2551))
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("홈", image: "tabbarHome")       
                    }
                CalenderView()
                    .tabItem {
                        Label("일정", image: "tabbarCalendar")
                    }
                ContentView()
                    .tabItem {
                        Label("수면분석", image: "tabbarSleepAnalysis")
                    }
                ContentView()
                    .tabItem {
                        Label("설정", image: "tabbarSetting")
                    }
            }
        }
    }
}
