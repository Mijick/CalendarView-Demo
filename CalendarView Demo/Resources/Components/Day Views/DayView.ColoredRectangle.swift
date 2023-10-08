//
//  DayView.ColoredRectangle.swift of CalendarView Demo
//
//  Created by Alina Petrovska on 02.12.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickCalendarView

extension DV { struct ColoredRectangle: DayView {
    var date: Date
    var color: Color?
    var isCurrentMonth: Bool
    var selectedDate: Binding<Date?>?
    var selectedRange: Binding<MijickCalendarView.MDateRange?>?
}}

extension DV.ColoredRectangle {
    func createDayLabel() -> AnyView {
        ZStack {
            createBackgroundView()
            createDayLabelText()
        }
        .erased()
    }
    func createSelectionView() -> AnyView {
        RoundedRectangle(cornerRadius: 3)
            .fill(.background)
            .strokeBorder(color ?? .redAccent, lineWidth: 3)
            .transition(.asymmetric(insertion: .scale(scale: 0.5).combined(with: .opacity), removal: .opacity))
            .active(if: isSelected() && !isPast())
            .erased()
    }
}
private extension DV.ColoredRectangle {
    func createBackgroundView() -> some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(Color.clear)
            .padding(4)
            .background(getBackgroundColor())
            .padding(4)
            
    }
}
private extension DV.ColoredRectangle {
    func createDayLabelText() -> some View {
        Text(getStringFromDay(format: "d"))
            .font(.regular(17))
            .foregroundColor(getTextColor())
            .strikethrough(isPast())
    }
}
private extension DV.ColoredRectangle {
    func getTextColor() -> Color {
        guard !isPast() else { return .onBackgroundSecondary }
        
        switch isSelected() {
            case true: return color == nil ? .onBackgroundPrimary : .white
            case false: return color == nil ? .onBackgroundPrimary : .white
        }
    }
    func getBackgroundColor() -> Color {
        guard !isPast() else { return .backgroundSecondary }

        switch isSelected() {
            case true: return color ?? .backgroundPrimary
            case false: return color ?? .backgroundPrimary
        }
    }
}

// MARK: - On Selection Logic
extension DV.ColoredRectangle {
    func onSelection() {
        if !isPast() { selectedDate?.wrappedValue = date }
    }
}
