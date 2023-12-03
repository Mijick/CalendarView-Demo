//
//  DayView.Price.swift of CalendarView Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickCalendarView

extension DV { struct Price: DayView {
    let date: Date
    let isCurrentMonth: Bool
    let selectedDate: Binding<Date?>?
    let selectedRange: Binding<MijickCalendarView.MDateRange?>?
}}
extension DV.Price {
    func createContent() -> AnyView {
        ZStack {
            createSelectionView()
            createDayLabel()
        }
        .erased()
    }
    func createDayLabel() -> AnyView {
        createDayText()
            .frame(maxWidth: .infinity)
            .padding(.top, 16)
            .padding(.bottom, 16)
            .border(.backgroundTertiary, width: 1)
            .background(isPast() ? .backgroundTertiary.opacity(0.6) : .clear)
            .erased()
    }
    func createSelectionView() -> AnyView {
        Rectangle()
            .fill(Color.clear)
            .border(.onBackgroundPrimary, width: 3)
            .active(if: isSelected())
            .erased()
    }
}
private extension DV.Price {
    func createDayText() -> some View {
        VStack(spacing: 16) {
            createDateText()
            createPriceText()
        }
        .opacity(isPast() ? 0.6 : 1)
    }
}
private extension DV.Price {
    func createDateText() -> some View {
        Text(getStringFromDay(format: "d"))
            .font(.semiBold(15))
            .foregroundStyle(.onBackgroundPrimary)
    }
    func createPriceText() -> some View {
        Text("$\((144...420).randomElement() ?? 200)")
            .font(.regular(12))
            .foregroundStyle(.onBackgroundSecondary)
    }
}

// MARK: - On Selection Logic
extension DV.Price {
    func onSelection() { if !isPast() {
        selectedDate?.wrappedValue = date
    }}
}
