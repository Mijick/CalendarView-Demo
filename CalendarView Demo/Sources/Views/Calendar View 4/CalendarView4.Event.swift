//
//  CalendarView4.Event.swift of CalendarView Demo
//
//  Created by Alina Petrovska on 02.12.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import Foundation
import SwiftUI

extension CalendarView4 {
    struct Event: Equatable, Hashable {
        let name: String
        let range: String
        let color: Color
    }
}
