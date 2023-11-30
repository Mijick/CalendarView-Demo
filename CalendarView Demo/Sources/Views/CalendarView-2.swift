//
//  CalendarView-2.swift of CalendarView Demo
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

struct CalendarView2: NavigatableView {
    @State private var selectedDate: Date? = .now
    @State private var endMonth: Date = .now


    func configure(view: NavigationConfig) -> NavigationConfig { view
        .backgroundColour(.backgroundPrimary)
    }
    var body: some View {
        VStack(spacing: 0) {
            createNavigationBar()
            Spacer.height(16)
            createTopMonthView()
            Spacer.height(28)
            createCalendarView()
            createTabBar()
        }
        .animation(.bouncy, value: endMonth)
    }
}
private extension CalendarView2 {
    func createNavigationBar() -> some View {
        NavigationBar(logoName: "calendar-2")
            .padding(.horizontal, margins)
    }
    func createTopMonthView() -> some View {
        TopMonthView(currentMonth: endMonth)
    }
    func createCalendarView() -> some View {
        MCalendarView(selectedDate: $selectedDate, selectedRange: nil, configBuilder: configureCalendar)
            .padding(.horizontal, margins)
    }
    func createTabBar() -> some View {
        TabBar()
    }
}
private extension CalendarView2 {
    func configureCalendar(_ config: CalendarConfig) -> CalendarConfig { config
        .dayView(CustomDayView.init)
        .monthLabel(CustomMonthLabel.init)
        .onMonthChange { endMonth = $0 }
    }
}

// MARK: - Top Month View
fileprivate struct TopMonthView: View {
    let currentMonth: Date

    var body: some View {
        HStack(spacing: 2) {
            createText()
            createIcon()
        }
    }
}
private extension TopMonthView {
    func createText() -> some View {
        Text(text)
            .font(.semiBold(18))
            .foregroundStyle(.onBackgroundPrimary)
            .contentTransition(.numericText(countsDown: true))
    }
    func createIcon() -> some View {
        Image("chevron-down")
            .resizable()
            .frame(20)
            .foregroundStyle(.onBackgroundPrimary)
    }
}
private extension TopMonthView {
    var text: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: currentMonth)
    }
}

// MARK: - Calendar Day View
fileprivate struct CustomDayView: DayView {
    var date: Date
    
    var isCurrentMonth: Bool
    
    var selectedDate: Binding<Date?>?
    
    var selectedRange: Binding<MijickCalendarView.MDateRange?>?
    


}

// MARK: - Month Label
fileprivate struct CustomMonthLabel: MonthLabel {
    var month: Date
    
    func createContent() -> AnyView {
        Text(getString(format: "MMMM yyyy"))
            .font(.semiBold(18))
            .foregroundStyle(.onBackgroundPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .erased()
    }
}


// MARK: - Modifiers
fileprivate let margins: CGFloat = 24


// MARK: - Preview
#Preview {
    CalendarView2()
}
