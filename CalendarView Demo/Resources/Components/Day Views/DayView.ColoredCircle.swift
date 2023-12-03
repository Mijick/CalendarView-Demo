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
    var selectedRange: Binding<MijickCalendarView.MDateRange?>?
}}

extension DV.ColoredCircle {
    func createDayLabel() -> AnyView {
        isPast() ? createPastView() : createMarkedView(color ?? .backgroundPrimary)
    }
    func createSelectionView() -> AnyView {
        Circle()
            .fill(.clear)
            .stroke(.onBackgroundPrimary, lineWidth: 4)
            .frame(width: 53, height: 53)
            .transition(.asymmetric(insertion: .scale(scale: 0.5).combined(with: .opacity), removal: .opacity))
            .padding(.horizontal, 1)
            .active(if: isSelected() && !isPast())
            .erased()
    }
    func onSelection() {
        if !isPast() { selectedDate?.wrappedValue = date }
    }
}

private extension DV.ColoredCircle {
    func createMarkedView(_ color: Color) -> AnyView  {
        createNumberLabel()
            .background { createBackgroundView() }
            .frame(width: 53, height: 53, alignment: .center)
            .erased()
    }
    func createPastView() -> AnyView  {
        createNumberLabel()
            .overlay(content: createCrossLine)
            .background { createBackgroundView() }
            .erased()
    }
}

private extension DV.ColoredCircle {
    func createBackgroundView() -> some View {
        Circle()
            .frame(width: 46, height: 46)
            .foregroundColor(getBackgroundColor())
    }
    func createCrossLine() -> some View {
        Rectangle()
            .fill(.onBackgroundSecondary.opacity(0.7))
            .frame(height: 2)
    }
}
private extension DV.ColoredCircle {
    func createNumberLabel() -> some View {
        Text(getStringFromDay(format: "d"))
            .font(.regular(17))
            .foregroundColor(getTextColor())
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
