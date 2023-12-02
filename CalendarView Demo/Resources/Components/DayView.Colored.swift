//
//  DayView.Colored.swift of CalendarView Demo
//
//  Created by Alina Petrovska on 02.12.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickCalendarView

extension DV { struct Colored: DayView {
    var date: Date
    var color: Color?
    var isCurrentMonth: Bool
    var selectedDate: Binding<Date?>?
    var selectedRange: Binding<MijickCalendarView.MDateRange?>?
}}

extension DV.Colored {
    func createDayLabel() -> AnyView {
        isPast() ? createPastView() : createMarkedView(color ?? .backgroundPrimary)
    }
    func createSelectionView() -> AnyView {
        RoundedRectangle(cornerRadius: 3)
            .fill(.background)
            .stroke(color ?? .redAccent, lineWidth: 3)
            .frame(width: 49, height: 49)
            .transition(.asymmetric(insertion: .scale(scale: 0.5).combined(with: .opacity), removal: .opacity))
            .padding(.horizontal, 1)
            .active(if: isSelected() && !isPast())
            .erased()
    }
}

private extension DV.Colored {
    func createMarkedView(_ color: Color) -> AnyView  {
        createNumberLabel(self.color == nil ? .onBackgroundPrimary : .white)
            .background { createBackgroundView(color) }
            .erased()
    }
    func createPastView() -> AnyView  {
        createNumberLabel(.onBackgroundSecondary)
            .overlay(content: createCrossLine)
            .background { createBackgroundView(.backgroundSecondary) }
            .erased()
    }
}

private extension DV.Colored {
    func createBackgroundView(_ color: Color) -> some View {
        RoundedRectangle(cornerRadius: 4)
            .frame(width: 40, height: 40)
            .foregroundColor(color)
    }
    func createCrossLine() -> some View {
        Rectangle()
            .fill(.onBackgroundSecondary.opacity(0.7))
            .frame(height: 2)
    }
}

private extension DV.Colored {
    func createNumberLabel(_ color: Color) -> some View {
        Text(getStringFromDay(format: "d"))
            .font(.regular(17))
            .foregroundColor(color)
    }
}
