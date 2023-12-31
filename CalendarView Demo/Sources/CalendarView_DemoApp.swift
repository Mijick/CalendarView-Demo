//
//  CalendarView_DemoApp.swift of CalendarView Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickNavigattie

@main struct CalendarView_DemoApp: App {
    var body: some Scene { WindowGroup {
        HomeView().implementNavigationView(config: config)
    }}
}
private extension CalendarView_DemoApp {
    var config: NavigationGlobalConfig {
        let config = NavigationGlobalConfig()
        config.backgroundColour = .backgroundPrimary
        return config
    }
}
