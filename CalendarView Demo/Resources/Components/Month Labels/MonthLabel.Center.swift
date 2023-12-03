//
//  MonthLabel.Center.swift of CalendarView Demo
//
//  Created by Alina Petrovska on 01.12.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import Foundation
import MijickCalendarView
import SwiftUI

extension ML { struct Center: MonthLabel {
    let month: Date

    func createContent() -> AnyView {
        Text(getString(format: "MMMM yyyy").uppercased())
            .font(.semiBold(18))
            .foregroundStyle(.onBackgroundSecondary)
            .frame(maxWidth: .infinity, alignment: .center)
            .erased()
    }
}}
