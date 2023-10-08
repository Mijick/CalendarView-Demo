//
//  TabBar.swift of CalendarView Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct TabBar: View {
    var body: some View {
        VStack(spacing: 0) {
            createDivider()
            Spacer.height(12)
            createButtons()
            Spacer.height(4)
        }
    }
}
private extension TabBar {
    func createDivider() -> some View {
        Divider()
    }
    func createButtons() -> some View {
        HStack(spacing: 0) {
            ForEach(Item.allCases, id: \.self, content: createButton)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
    }
}
private extension TabBar {
    func createButton(_ item: TabBar.Item) -> some View {
        TabBarButton(item: item)
    }
}

// MARK: - Button
fileprivate struct TabBarButton: View {
    let item: TabBar.Item

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 5) {
                createIcon()
                createTitle()
            }
        }
        .frame(maxWidth: .infinity)
    }
}
private extension TabBarButton {
    func createIcon() -> some View {
        Image(item.iconName)
            .resizable()
            .frame(28)
            .foregroundStyle(colour)
    }
    func createTitle() -> some View {
        Text(item.title)
            .font(.regular(11))
            .foregroundStyle(colour)
    }
}
private extension TabBarButton {
    func onTap() {

    }
}
private extension TabBarButton {
    var colour: Color { item.isActive ? .accent : .onBackgroundSecondary }
}

// MARK: - Items
extension TabBar { enum Item: CaseIterable {
    case home, search, bookmarks
}}
extension TabBar.Item {
    var iconName: String { switch self {
        case .home: return "home"
        case .search: return "search"
        case .bookmarks: return "bookmark"
    }}
    var title: String { String(describing: self).capitalized }
    var isActive: Bool { self == .home }
}


// MARK: - Preview
#Preview {
    TabBar()
}
