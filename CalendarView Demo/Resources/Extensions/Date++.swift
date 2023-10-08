//
//  Date.swift
//  CalendarView Demo
//
//  Created by Alina Petrovska on 02.12.2023.
//

import Foundation

extension Date {
    func add(_ number: Int, _ component: Calendar.Component) -> Date {
        return Calendar.current.date(byAdding: component, value: number, to: self) ?? Date()
    }
    func isSame(_ date: Date) -> Bool {
        Calendar.current.compare(self, to: date, toGranularity: .day) == .orderedSame
    }
}
