//
//  Color++.swift of CalendarView Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Color {
    static let greenAccent: Color = .init(hex: 0x426A5A)
    static let orangeAccent: Color = .init(hex: 0xF18F01)
    static let redAccent: Color = .init(hex: 0xAE3648)
    static let grayAccent: Color = .init(hex: 0x4D5B6B)
}

// MARK: - Initialisation with HEX value
fileprivate extension Color {
    init(hex: UInt) { self.init(.sRGB, red: Double((hex >> 16) & 0xff) / 255, green: Double((hex >> 08) & 0xff) / 255, blue: Double((hex >> 00) & 0xff) / 255, opacity: 1) }
}
