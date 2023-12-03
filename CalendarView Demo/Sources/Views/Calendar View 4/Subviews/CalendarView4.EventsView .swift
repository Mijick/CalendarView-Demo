//
//  CalendarView1.EventsView.swift of CalendarView Demo
//
//  Created by Alina Petrovska on 02.12.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI

extension CalendarView4 {
    struct EventsView: View {
        @Binding var selectedDate: Date?
        let events: [Date: [Event]]
        
        var body: some View {
            VStack() {
                createTitle()
                createContent()
            }
        }
    }
}

private extension CalendarView4.EventsView {
    func createTitle() -> some View {
        Text(title)
            .font(.bold(20))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    @ViewBuilder func createContent() -> some View {
        switch events[selectedDate] {
            case .some(let events): createEventsList(events)
            case .none: EmptyView()
        }
    }
}

private extension CalendarView4.EventsView {
    func createEventsList(_ events: [Event]) -> some View {
        VStack {
            ForEach(events, id: \.self, content: createElement)
        }
    }
    func createElement(_ event: Event) -> some View {
        HStack(spacing: 10) {
            createColoredIndicator(event)
            
            VStack(spacing: 0) {
                createEventTitle(event)
                createEventSubtitle(event)
            }
        }
    }
}
// MARK: Event UI
private extension CalendarView4.EventsView {
    func createColoredIndicator(_ event: Event) -> some View  {
        RoundedRectangle(cornerRadius: 3)
            .fill(event.color)
            .frame(width: 6, height: 20)
    }
    func createEventTitle(_ event: Event) -> some View {
        Text(event.name)
            .foregroundStyle(.onBackgroundPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func createEventSubtitle(_ event: Event) -> some View {
        Text(event.range)
            .foregroundStyle(.onBackgroundSecondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
private extension CalendarView4.EventsView {
    var title: String {
        guard let selectedDate else { return "" }
        if Date.now.isSame(selectedDate) { return "TODAY" }
        else { return day.uppercased() }
    }
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE d yyyy"
        return dateFormatter.string(from: selectedDate ?? Date())
    }
}

// MARK: Helpers
fileprivate extension [Date: [Event]] {
    subscript(_ key: Date?) -> [Event]? {
        guard let key else { return nil }
        return self.first(where: { $0.key.isSame(key) })?.value
    }
}

fileprivate typealias Event = CalendarView4.Event
