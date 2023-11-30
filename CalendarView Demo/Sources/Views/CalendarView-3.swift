//
//  CalendarView-3.swift of CalendarView Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickNavigattie
import MijickCalendarView

struct CalendarView3: NavigatableView {
    @State private var selectedRange: MDateRange? = .init()


    var body: some View {
        VStack(spacing: 0) {
            createNavigationBar()
            Spacer.height(16)
            createSelectedRangeView()
            Spacer.height(32)
            createCalendarView()
            Spacer()
            createBottomView()
        }
    }
}
private extension CalendarView3 {
    func createNavigationBar() -> some View {
        NavigationBar(logoName: "calendar-2")
            .padding(.horizontal, margins)
    }
    func createSelectedRangeView() -> some View {
        SelectedRangeView(selectedRange: $selectedRange)
    }
    func createCalendarView() -> some View {
        MCalendarView(selectedDate: nil, selectedRange: $selectedRange, configBuilder: configureCalendar)
    }
    func createBottomView() -> some View {
        Btn.Default(title: "Continue", action: onContinueButtonTap)
            .padding(.top, 12)
            .padding(.horizontal, margins)
    }
}
private extension CalendarView3 {
    func configureCalendar(_ config: CalendarConfig) -> CalendarConfig { config
        .monthsSpacing(40)
        .monthsTopPadding(44)
        .dayView(DV.RangeSelector.init)
        .monthLabel { ML.Leading(month: $0, horizontalPadding: margins) }
        .monthsViewBackground(.backgroundTertiary.opacity(0.68))
    }
}
private extension CalendarView3 {
    func onContinueButtonTap() {

    }
}

// MARK: - Selected Range View
fileprivate struct SelectedRangeView: View {
    @Binding var selectedRange: MDateRange?


    var body: some View {
        HStack(spacing: 12) {
            createDateText(startDateText)
            createArrowIcon()
            createDateText(endDateText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, margins)
        .animation(.bouncy, value: selectedRange?.getRange())
    }
}
private extension SelectedRangeView {
    func createDateText(_ text: String) -> some View {
        Text(text)
            .font(.semiBold(24))
            .foregroundStyle(.onBackgroundPrimary)
            .lineLimit(1)
            .contentTransition(.numericText(countsDown: true))
    }
    func createArrowIcon() -> some View {
        Image("arrow-right")
            .resizable()
            .frame(28)
            .foregroundStyle(.onBackgroundSecondary)
    }
}
private extension SelectedRangeView {
    var startDateText: String {
        guard let date = selectedRange?.getRange()?.lowerBound else { return "N/A" }
        return dateFormatter.string(from: date)
    }
    var endDateText: String {
        guard let date = selectedRange?.getRange()?.upperBound else { return "N/A" }
        return dateFormatter.string(from: date)
    }
}
private extension SelectedRangeView {
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM d"
        return dateFormatter
    }
}


// MARK: - Modifiers
fileprivate let margins: CGFloat = 24


// MARK: - Preview
#Preview {
    CalendarView3()
}
