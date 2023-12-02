//
//  CalendarView-1.swift of CalendarView Demo
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

struct CalendarView1: NavigatableView {
    @State private var selectedDate: Date?
    
    var body: some View {
        ZStack {
            createContent()
            createOverlayButton()
        }
    }
}
private extension CalendarView1 {
    func createContent() -> some View {
        VStack(spacing: 0) {
            createNavigationBar()
            Spacer.height(28)
            createTitleView()
            Spacer.height(32)
            createCalendarView()
            Spacer()
        }
    }
    func createOverlayButton() -> some View {
        VStack(spacing: 0) {
            Spacer()
            createBottomView()
        }
    }
}
private extension CalendarView1 {
    func createNavigationBar() -> some View {
        NavigationBar(logoName: "calendar-2").padding(.horizontal, margins)
    }
    func createTitleView() -> some View {
        TitleView()
    }
    func createCalendarView() -> some View {
        MCalendarView(selectedDate: $selectedDate, selectedRange: nil, configBuilder: configureCalendar)
            .padding(.horizontal, margins)
    }
    func createBottomView() -> some View {
        Btn.Default(title: "Continue", action: onContinueButtonTap)
            .padding(.horizontal, margins)
    }
}
private extension CalendarView1 {
    func configureCalendar(_ config: CalendarConfig) -> CalendarConfig {
        config
            .startMonth(.init(timeIntervalSince1970: 1698871714))
            .daysHorizontalSpacing(10)
            .daysVerticalSpacing(19)
            .monthsBottomPadding(16)
            .monthsTopPadding(42)
            .monthLabel { ML.Center(month: $0) }
            .dayView(buildDayView)
    }
}
private extension CalendarView1 {
    func buildDayView(_ date: Date, _ isCurrentMonth: Bool, selectedDate: Binding<Date?>?, range: Binding<MDateRange?>?) -> DV.Colored {
        return .init(date: date, color: getDateColor(date), isCurrentMonth: isCurrentMonth, selectedDate: selectedDate, selectedRange: nil)
    }
}

private extension CalendarView1 {
    func onContinueButtonTap() { }
    func getDateColor(_ date: Date) -> Color? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        
        let day = Int(dateFormatter.string(from: date)) ?? 0
        if day % 5 == 0 { return .redAccent }
        if day % 9 == 0 { return .orangeAccent }
        if day % 11 == 0  { return .greenAccent }
        return nil
    }
}

// MARK: - Modifiers
fileprivate let margins: CGFloat = 28

// MARK: - Preview
#Preview {
    CalendarView1()
}
