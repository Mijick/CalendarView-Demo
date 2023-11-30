//
//  MonthLabel.Leading.swift of CalendarView Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickCalendarView

extension ML { struct Leading: MonthLabel {
    let month: Date
    var horizontalPadding: CGFloat = 0

    func createContent() -> AnyView {
        Text(getString(format: "MMMM yyyy"))
            .font(.semiBold(18))
            .foregroundStyle(.onBackgroundPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, horizontalPadding)
            .erased()
    }
}}
