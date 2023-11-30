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
import Combine
import MijickNavigattie
import MijickCalendarView

// MARK: - ViewModel
fileprivate class ViewModel: ObservableObject {
    @Published var selectedDate: Date? = nil
    var endMonth: CurrentValueSubject<Date, Never> = .init(.now)
}


// MARK: - Implementation
struct CalendarView2: NavigatableView {
    @StateObject private var viewModel: ViewModel = .init()


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
    }
}
private extension CalendarView2 {
    func createNavigationBar() -> some View {
        NavigationBar(logoName: "calendar-2")
            .padding(.horizontal, margins)
    }
    func createTopMonthView() -> some View {
        TopMonthView(currentMonth: viewModel.endMonth)
    }
    func createCalendarView() -> some View {
        MCalendarView(selectedDate: $viewModel.selectedDate, selectedRange: nil, configBuilder: configureCalendar)
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
        .onMonthChange(viewModel.endMonth.send)
    }
}

// MARK: - Top Month View
fileprivate struct TopMonthView: View {
    let currentMonth: CurrentValueSubject<Date, Never>
    @State private var _currentMonth: Date = .now

    var body: some View {
        HStack(spacing: 2) {
            createText()
            createIcon()
        }
        .animation(.bouncy, value: _currentMonth)
        .onReceive(currentMonth) { _currentMonth = $0 }
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
        return dateFormatter.string(from: _currentMonth)
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
