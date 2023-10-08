//
//  CalendarView-4.swift of CalendarView Demo
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

struct CalendarView4: NavigatableView {
    @State private var selectedDate: Date? = .now
    @State private var selectedMonth: Date = .now
    private let events: [Date: [Event]] = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            createNavigationBar()
            Spacer.height(40)
            createCalendarView()
            Spacer.height(24)
            createEventsView()
            Spacer()
        }
    }
}
private extension CalendarView4 {
    func createNavigationBar() -> some View {
        NavigationBar(logoName: "calendar-4")
            .padding(.horizontal, 24)
    }
    func createCalendarView() -> some View {
        MCalendarView(selectedDate: $selectedDate, selectedRange: nil, configBuilder: configureCalendar)
            .padding(.horizontal, 24)
            .scrollDisabled(true)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createEventsView() -> some View {
        EventsView(selectedDate: $selectedDate, events: events)
            .padding(.horizontal, 20)
    }
}
private extension CalendarView4 {
    func configureCalendar(_ config: CalendarConfig) -> CalendarConfig {
        config
            .monthsTopPadding(36)
            .monthsBottomPadding(8)
            .daysHorizontalSpacing(1)
            .daysVerticalSpacing(3)
            .startMonth(selectedMonth)
            .endMonth(selectedMonth)
            .monthLabel(ML.Uppercased.init)
            .dayView(buildDayView)
    }
}
private extension CalendarView4 {
    func buildDayView(_ date: Date, _ isCurrentMonth: Bool, selectedDate: Binding<Date?>?, range: Binding<MDateRange?>?) -> DV.ColoredCircle {
        return .init(date: date, color: getDateColor(date), isCurrentMonth: isCurrentMonth, selectedDate: selectedDate, selectedRange: nil)
    }
    func getDateColor(_ date: Date) -> Color? {
       let hasSavedEvents = events.first(where: { $0.key.isSame(date) }) != nil
        return hasSavedEvents ? .grayAccent : nil
    }
}

// MARK: Helpers
fileprivate extension [Date: [CalendarView4.Event]] {
    init() {
        let events1: [CalendarView4.Event] = [
            .init(name: "Call mom", range: "06:10 - 07:15", color: .greenAccent),
            .init(name: "Visit dentist", range: "12:00 - 14:15", color: .redAccent)
        ]
        let events2: [CalendarView4.Event] = [ .init(name: "Meet with Daniella", range: "08:00 - 08:15", color: .orangeAccent) ]
        let events3: [CalendarView4.Event] = [ .init(name: "Visit dentist", range: "15:00 - 16:00", color: .redAccent) ]
        
        self = [ Date.now: events1, Date.now.add(2, .day): events2, Date.now.add(3, .day): events3 ]
    }
}


// MARK: - Preview
#Preview {
    CalendarView4()
}
