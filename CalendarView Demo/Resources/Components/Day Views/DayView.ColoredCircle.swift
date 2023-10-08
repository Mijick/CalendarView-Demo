//
//  DayView.ColoredCircle.swift of CalendarView Demo
//
//  Created by Alina Petrovska on 02.12.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickCalendarView

extension DV { struct ColoredCircle: DayView {
    var date: Date
    var color: Color?
    var isCurrentMonth: Bool
    var selectedDate: Binding<Date?>?
    var selectedRange: Binding<MDateRange?>?
}}

extension DV.ColoredCircle {
    func createDayLabel() -> AnyView {
        ZStack {
            createDayLabelBackground()
            createDayLabelText()
        }
        .erased()
    }
    func createSelectionView() -> AnyView {
        Circle()
            .fill(.clear)
            .strokeBorder(.onBackgroundPrimary, lineWidth: 1)
            .transition(.asymmetric(insertion: .scale(scale: 0.5).combined(with: .opacity), removal: .opacity))
            .active(if: isSelected() && !isPast())
            .erased()
    }
}
private extension DV.ColoredCircle {
    func createDayLabelBackground() -> some View {
        Circle()
            .fill(isSelected() ? .onBackgroundPrimary : color ?? .clear)
            .padding(4)
    }
    func createDayLabelText() -> some View  {
        Text(getStringFromDay(format: "d"))
            .font(.regular(17))
            .foregroundColor(getTextColor())
            .strikethrough(isPast())
    }
}
private extension DV.ColoredCircle {
    func getTextColor() -> Color {
        guard !isPast() else { return .onBackgroundSecondary }
        
        switch isSelected() {
            case true: return .backgroundPrimary
            case false: return color == nil ? .onBackgroundPrimary : .white
        }
    }
    func getBackgroundColor() -> Color {
        guard !isPast() else { return .clear }

        switch isSelected() {
            case true: return .onBackgroundPrimary
            case false: return color ?? .clear
        }
    }
}

// MARK: - On Selection Logic
extension DV.ColoredCircle {
    func onSelection() {
        if !isPast() { selectedDate?.wrappedValue = date }
    }
}
