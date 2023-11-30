//
//  Font++.swift of CalendarView Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Font {
    static func headline(_ size: CGFloat) -> Font { .custom("Lora-Bold", size: size) }
    static func bold(_ size: CGFloat) -> Font { .custom("Inter-Bold", size: size) }
    static func semiBold(_ size: CGFloat) -> Font { .custom("Inter-SemiBold", size: size) }
    static func regular(_ size: CGFloat) -> Font { .custom("Inter-Regular", size: size) }
    static func thin(_ size: CGFloat) -> Font { .custom("Inter-Thin", size: size) }
}
