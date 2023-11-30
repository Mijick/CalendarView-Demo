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
    @State private var selectedRange: MDateRange = .init()


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
private extension CalendarView1 {
    func createNavigationBar() -> some View {
        NavigationBar(logoName: "calendar-2")
            .padding(.horizontal, margins)
    }
    func createSelectedRangeView() -> some View {
        SelectedRangeView(selectedRange: $selectedRange)
    }
    func createCalendarView() -> some View {
        EmptyView()
    }
    func createBottomView() -> some View {
        BottomView()
    }
}

// MARK: - Selected Range View
fileprivate struct SelectedRangeView: View {
    @Binding var selectedRange: MDateRange


    var body: some View {
        HStack(spacing: 12) {
            createFirstDateText()
            createArrowIcon()
            createSecondDateText()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, margins)
    }
}
private extension SelectedRangeView {
    func createFirstDateText() -> some View {
        Text(startDateText)
            .font(.semiBold(26))
            .foregroundStyle(.onBackgroundPrimary)
    }
    func createArrowIcon() -> some View {
        Image("arrow-right")
            .resizable()
            .frame(28)
            .foregroundStyle(.onBackgroundSecondary)
    }
    func createSecondDateText() -> some View {
        Text(endDateText)
            .font(.semiBold(26))
            .foregroundStyle(.onBackgroundPrimary)
    }
}
private extension SelectedRangeView {
    var startDateText: String {
        guard let date = selectedRange.getRange()?.lowerBound else { return "N/A" }
        return dateFormatter.string(from: date)
    }
    var endDateText: String {
        guard let date = selectedRange.getRange()?.upperBound else { return "N/A" }
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

// MARK: - Bottom View
fileprivate struct BottomView: View {
    var body: some View {
        VStack(spacing: 20) {
            createDivider()
            createContinueButton()
        }
    }
}
private extension BottomView {
    func createDivider() -> some View {
        Divider()
    }
    func createContinueButton() -> some View {
        Btn.Default(title: "Continue", action: onContinueButtonTap)
            .padding(.horizontal, margins)
    }
}
private extension BottomView {
    func onContinueButtonTap() {

    }
}


// MARK: - Modifiers
fileprivate let margins: CGFloat = 24


// MARK: - Preview
#Preview {
    CalendarView1()
}
